import 'dart:developer';

import '../../domain/entities/course.dart';
import '../../domain/repositories/course_repository.dart';
import '../datasources/course_api_datasource.dart';
import '../datasources/local_datasource.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseApiDataSource _apiDataSource;
  final LocalStorageDataSource _localDataSource;

  CourseRepositoryImpl({
    required CourseApiDataSource apiDataSource,
    required LocalStorageDataSource localDataSource,
  })  : _apiDataSource = apiDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Course?> getCourseById(String id) async {
    try {
      final course = await _apiDataSource.getCourseById(id);
      if (course != null) {
        await _localDataSource.updateCoursesPreservingFavorites([course]);
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
    List<String>? roles,
    List<String>? subjects,
  }) async {
    try {
      final courses = await _apiDataSource.getCourses(
        page: page,
        pageSize: pageSize,
        search: search,
        type: type,
        level: level,
        products: products,
        roles: roles,
        subjects: subjects,
      );

      if (courses.isNotEmpty) {
        await _localDataSource.updateCoursesPreservingFavorites(courses);
      }

      return courses;
    } catch (e) {
      log('Error al obtener cursos de la API: $e');
      rethrow;
    }
  }
}
