import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/module.dart';

abstract class LocalStorageDataSource {
  Future<void> clearCourses();
  Future<void> deleteCourse(String id);
  Future<Module?> getCourseById(String id);
  Future<List<Module>> getCourses();
  Future<void> saveCourses(List<Module> courses);
}

class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  static const String _coursesKey = 'courses';

  @override
  Future<void> clearCourses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_coursesKey);
    } catch (e) {
      throw Exception('Error al limpiar cursos: $e');
    }
  }

  @override
  Future<void> deleteCourse(String id) async {
    try {
      final courses = await getCourses();
      final updatedCourses = courses.where((course) => course.uid != id).toList();
      await saveCourses(updatedCourses);
    } catch (e) {
      throw Exception('Error al eliminar curso: $e');
    }
  }

  @override
  Future<Module?> getCourseById(String id) async {
    try {
      final courses = await getCourses();
      return courses.where((course) => course.uid == id).firstOrNull;
    } catch (e) {
      throw Exception('Error al obtener curso: $e');
    }
  }

  @override
  Future<List<Module>> getCourses() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final coursesString = prefs.getString(_coursesKey);

      if (coursesString == null) return [];

      final coursesJson = jsonDecode(coursesString) as List;
      return coursesJson.map((json) => _courseFromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al obtener cursos: $e');
    }
  }

  @override
  Future<void> saveCourses(List<Module> courses) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final coursesJson = courses.map((course) => _courseToJson(course)).toList();
      await prefs.setString(_coursesKey, jsonEncode(coursesJson));
    } catch (e) {
      throw Exception('Error al guardar cursos: $e');
    }
  }

  Module _courseFromJson(Map<String, dynamic> json) {
    return Module(
      summary: json['summary'] as String? ?? '',
      levels: json['levels'] != null ? List<String>.from(json['levels']) : [],
      roles: json['roles'] != null ? List<String>.from(json['roles']) : [],
      products: json['products'] != null ? List<String>.from(json['products']) : [],
      subjects: json['subjects'] != null ? List<String>.from(json['subjects']) : [],
      uid: json['uid'] as String? ?? '',
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      durationInMinutes: json['durationInMinutes'] as int? ?? 0,
      rating: json['rating'] != null
          ? ModuleRating(
              count: json['rating']['count'] as int? ?? 0,
              average: (json['rating']['average'] as num?)?.toDouble() ?? 0.0,
            )
          : null,
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      iconUrl: json['iconUrl'] as String?,
      socialImageUrl: json['socialImageUrl'] as String?,
      locale: json['locale'] as String? ?? '',
      lastModified: json['lastModified'] as String? ?? '',
      url: json['url'] as String? ?? '',
      firstUnitUrl: json['firstUnitUrl'] as String?,
      units: json['units'] != null ? List<String>.from(json['units']) : [],
      numberOfChildren: json['numberOfChildren'] as int? ?? 0,
    );
  }

  Map<String, dynamic> _courseToJson(Module course) {
    return {
      'summary': course.summary,
      'levels': course.levels,
      'roles': course.roles,
      'products': course.products,
      'subjects': course.subjects,
      'uid': course.uid,
      'type': course.type,
      'title': course.title,
      'durationInMinutes': course.durationInMinutes,
      'rating': course.rating != null
          ? {
              'count': course.rating!.count,
              'average': course.rating!.average,
            }
          : null,
      'popularity': course.popularity,
      'iconUrl': course.iconUrl,
      'socialImageUrl': course.socialImageUrl,
      'locale': course.locale,
      'lastModified': course.lastModified,
      'url': course.url,
      'firstUnitUrl': course.firstUnitUrl,
      'units': course.units,
      'numberOfChildren': course.numberOfChildren,
    };
  }
}
