import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/error_messages.dart';
import '../../domain/entities/course.dart';

abstract class LocalStorageDataSource {
  Future<void> clearCourses();
  Future<void> deleteCourse(String id);
  Future<Course?> getCourseById(String id);
  Future<List<Course>> getCourses();
  Future<void> saveCourses(List<Course> courses);
  Future<void> updateCoursesPreservingFavorites(List<Course> newCourses);
}

class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  static const String _coursesKey = 'courses';

  @override
  Future<void> clearCourses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_coursesKey);
    } catch (e) {
      throw Exception('${ErrorMessages.errorClearingCourses}: $e');
    }
  }

  @override
  Future<void> deleteCourse(String id) async {
    try {
      final courses = await getCourses();
      final updatedCourses = courses.where((course) => course.uid != id).toList();
      await saveCourses(updatedCourses);
    } catch (e) {
      throw Exception('${ErrorMessages.errorDeletingCourse}: $e');
    }
  }

  @override
  Future<Course?> getCourseById(String id) async {
    try {
      final courses = await getCourses();
      return courses.where((course) => course.uid == id).firstOrNull;
    } catch (e) {
      throw Exception('${ErrorMessages.errorGettingCourse}: $e');
    }
  }

  @override
  Future<List<Course>> getCourses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final coursesString = prefs.getString(_coursesKey);

      if (coursesString == null) return [];

      final coursesJson = jsonDecode(coursesString) as List;
      return coursesJson.map((json) => _courseFromJson(json)).toList();
    } catch (e) {
      throw Exception('${ErrorMessages.errorGettingCourses}: $e');
    }
  }

  @override
  Future<void> saveCourses(List<Course> courses) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final coursesJson = courses.map((course) => _courseToJson(course)).toList();
      await prefs.setString(_coursesKey, jsonEncode(coursesJson));
    } catch (e) {
      throw Exception('${ErrorMessages.errorSavingCourses}: $e');
    }
  }

  @override
  Future<void> updateCoursesPreservingFavorites(List<Course> newCourses) async {
    try {
      // Obtener los cursos existentes
      final existingCourses = await getCourses();

      // Crear un mapa de cursos existentes por UID para acceso rápido
      final existingCoursesMap = <String, Course>{};
      for (final course in existingCourses) {
        existingCoursesMap[course.uid] = course;
      }

      // Crear la lista actualizada preservando el estado de favoritos
      final updatedCourses = <Course>[];

      for (final newCourse in newCourses) {
        // Verificar si el curso ya existe localmente
        final existingCourse = existingCoursesMap[newCourse.uid];

        if (existingCourse != null) {
          // Si existe, preservar el estado de favorito y actualizar el resto de la información
          final updatedCourse = newCourse.copyWith(isFavorite: existingCourse.isFavorite);
          updatedCourses.add(updatedCourse);
        } else {
          // Si es un curso nuevo, agregarlo con isFavorite = false por defecto
          updatedCourses.add(newCourse);
        }
      }

      // Guardar los cursos actualizados
      await saveCourses(updatedCourses);
    } catch (e) {
      throw Exception('${ErrorMessages.errorSavingCourses}: $e');
    }
  }

  Course _courseFromJson(Map<String, dynamic> json) {
    return Course(
      summary: json['summary'] as String? ?? '',
      levels: json['levels'] != null ? List<String>.from(json['levels']) : [],
      roles: json['roles'] != null ? List<String>.from(json['roles']) : [],
      products: json['products'] != null ? List<String>.from(json['products']) : [],
      uid: json['uid'] as String? ?? '',
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      durationInMinutes: json['durationInMinutes'] as int? ?? 0,
      durationInHours: json['durationInHours'] as int? ?? 0,
      iconUrl: json['iconUrl'] as String? ?? '',
      locale: json['locale'] as String? ?? '',
      url: json['url'] as String? ?? '',
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> _courseToJson(Course course) {
    return {
      'summary': course.summary,
      'levels': course.levels,
      'roles': course.roles,
      'products': course.products,
      'uid': course.uid,
      'type': course.type,
      'title': course.title,
      'durationInMinutes': course.durationInMinutes,
      'iconUrl': course.iconUrl,
      'locale': course.locale,
      'url': course.url,
      'isFavorite': course.isFavorite,
    };
  }
}
