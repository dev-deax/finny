import 'dart:developer';

import '../../domain/entities/course.dart';
import '../../domain/repositories/course_repository.dart';
import '../datasources/course_api_datasource.dart';
import '../datasources/isar_datasource.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseApiDataSource _apiDataSource;
  final LocalStorageDataSource _localDataSource;

  CourseRepositoryImpl({
    required CourseApiDataSource apiDataSource,
    required LocalStorageDataSource localDataSource,
  })  : _apiDataSource = apiDataSource,
        _localDataSource = localDataSource;

  @override
  Future<void> clearLocalCourses() async {
    try {
      await _localDataSource.clearCourses();
    } catch (e) {
      throw Exception('Error al limpiar cursos locales: $e');
    }
  }

  @override
  Future<Course?> getCourseById(String id) async {
    try {
      final course = await _apiDataSource.getCourseById(id);
      if (course != null) {
        await _localDataSource.saveCourses([course]);
        return course;
      }
    } catch (e) {
      try {
        return await _localDataSource.getCourseById(id);
      } catch (localError) {
        log('Error al obtener curso local: $localError');
      }
    }

    return null;
  }

  @override
  Future<List<Course>> getCourses({
    int page = 1,
    int pageSize = 20,
    String? search,
    String? type,
    String? level,
    List<String>? products,
  }) async {
    try {
      final courses = await _apiDataSource.getCourses(
        page: page,
        pageSize: pageSize,
        search: search,
        type: type,
        level: level,
        products: products,
      );

      if (courses.isNotEmpty) {
        await _localDataSource.saveCourses(courses);
      }

      return courses;
    } catch (e) {
      try {
        final localCourses = await _localDataSource.getCourses();
        if (localCourses.isNotEmpty) {
          return localCourses;
        }
      } catch (localError) {
        log('Error al obtener cursos locales: $localError');
      }

      rethrow;
    }
  }

  @override
  Future<List<Course>> getLocalCourses() async {
    try {
      return await _localDataSource.getCourses();
    } catch (e) {
      throw Exception('Error al obtener cursos locales: $e');
    }
  }

  @override
  Future<void> saveCoursesLocally(List<Course> courses) async {
    try {
      await _localDataSource.saveCourses(courses);
    } catch (e) {
      throw Exception('Error al guardar cursos localmente: $e');
    }
  }
}
