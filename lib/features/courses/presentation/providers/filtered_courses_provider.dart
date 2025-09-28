import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/course/course_providers.dart';
import 'filter_provider.dart';

// Provider que combina los filtros con la carga de cursos
final filteredCoursesProvider = StateNotifierProvider<FilteredCoursesNotifier, CourseListState>((ref) {
  return FilteredCoursesNotifier(ref);
});

class FilteredCoursesNotifier extends StateNotifier<CourseListState> {
  final Ref _ref;

  FilteredCoursesNotifier(this._ref) : super(const CourseListState()) {
    // Escuchar cambios en el estado de filtros
    _ref.listen(filterStateProvider, (previous, next) {
      _applyFilters();
    });

    // Escuchar cambios en el estado de cursos
    _listenToCourseChanges();

    // Cargar cursos inicialmente después de la construcción
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applyFilters();
    });
  }

  // Escuchar cambios en el estado de cursos y actualizar el estado local
  void _listenToCourseChanges() {
    _ref.listen(courseListProvider, (previous, next) {
      if (next != state) {
        state = next;
      }
    });
  }

  void _applyFilters() {
    final filterState = _ref.read(filterStateProvider);
    final courseListNotifier = _ref.read(courseListProvider.notifier);

    // Convertir filtros a parámetros de API
    final apiParams = filterState.toApiParams();

    // Cargar cursos con los filtros aplicados
    courseListNotifier.refreshCourses(
      search: apiParams['search'],
      type: apiParams['type'],
      level: apiParams['level'],
      products: apiParams['product']?.split(','),
      roles: apiParams['role']?.split(','),
      subjects: apiParams['subject']?.split(','),
    );
  }

  void loadMoreCourses() {
    final filterState = _ref.read(filterStateProvider);
    final courseListNotifier = _ref.read(courseListProvider.notifier);
    final apiParams = filterState.toApiParams();

    courseListNotifier.loadMoreCourses(
      search: apiParams['search'],
      type: apiParams['type'],
      level: apiParams['level'],
      products: apiParams['product']?.split(','),
      roles: apiParams['role']?.split(','),
      subjects: apiParams['subject']?.split(','),
    );
  }

  void refreshCourses() {
    _applyFilters();
  }
}
