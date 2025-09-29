import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/course.dart';
import '../../../domain/repositories/course_repository.dart';
import 'course_repository_provider.dart';

final courseByIdProvider = FutureProvider.family<Course?, String>((ref, courseId) async {
  final courseRepository = ref.watch(courseRepositoryProvider);
  return await courseRepository.getCourseById(courseId);
});

final courseListProvider = StateNotifierProvider<CourseListNotifier, CourseListState>((ref) {
  final courseRepository = ref.watch(courseRepositoryProvider);
  return CourseListNotifier(courseRepository: courseRepository);
});

class CourseListNotifier extends StateNotifier<CourseListState> {
  final CourseRepository _courseRepository;

  CourseListNotifier({required CourseRepository courseRepository})
      : _courseRepository = courseRepository,
        super(const CourseListState());

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<void> loadCourses({
    int page = 1,
    int pageSize = 20,
    String? search,
    String? type,
    String? level,
    List<String>? products,
    List<String>? roles,
    List<String>? subjects,
    bool refresh = false,
  }) async {
    if (refresh) {
      state = state.copyWith(
        courses: [],
        currentPage: 1,
        error: null,
      );
    }

    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final courses = await _courseRepository.getCourses(
        page: page,
        pageSize: pageSize,
        search: search,
        type: type,
        level: level,
        products: products,
        roles: roles,
        subjects: subjects,
      );

      state = state.copyWith(
        courses: refresh ? courses : [...state.courses, ...courses],
        isLoading: false,
        currentPage: page,
        hasMore: courses.length == pageSize,
        error: null,
      );
    } catch (e) {
      log('Error al cargar cursos: $e');

      if (e.toString().contains('conexión') || e.toString().contains('internet')) {
        state = state.copyWith(
          courses: [],
          isLoading: false,
          error: 'Sin conexión a internet. Los cursos no están disponibles sin conexión.',
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: e.toString(),
        );
      }
    }
  }

  Future<void> loadMoreCourses({
    String? search,
    String? type,
    String? level,
    List<String>? products,
    List<String>? roles,
    List<String>? subjects,
  }) async {
    if (!state.hasMore || state.isLoading) return;

    await loadCourses(
      page: state.currentPage + 1,
      search: search,
      type: type,
      level: level,
      products: products,
      roles: roles,
      subjects: subjects,
    );
  }

  Future<void> refreshCourses({
    String? search,
    String? type,
    String? level,
    List<String>? products,
    List<String>? roles,
    List<String>? subjects,
  }) async =>
      await loadCourses(
        page: 1,
        search: search,
        type: type,
        level: level,
        products: products,
        roles: roles,
        subjects: subjects,
        refresh: true,
      );
}

class CourseListState {
  final List<Course> courses;
  final bool isLoading;
  final String? error;
  final bool hasMore;
  final int currentPage;

  const CourseListState({
    this.courses = const [],
    this.isLoading = false,
    this.error,
    this.hasMore = true,
    this.currentPage = 1,
  });

  CourseListState copyWith({
    List<Course>? courses,
    bool? isLoading,
    String? error,
    bool? hasMore,
    int? currentPage,
  }) {
    return CourseListState(
      courses: courses ?? this.courses,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
