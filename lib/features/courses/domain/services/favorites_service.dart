import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:finny/features/courses/infrastructure/datasources/local_datasource.dart';

abstract class FavoritesService {
  Future<List<Course>> getFavoriteCourses();
  Future<void> addToFavorites(Course course);
  Future<void> removeFromFavorites(String courseId);
  Future<bool> isFavorite(String courseId);
  Future<void> clearFavorites();
}

class FavoritesServiceImpl implements FavoritesService {
  final LocalStorageDataSource _localStorageDataSource;

  FavoritesServiceImpl(this._localStorageDataSource);

  @override
  Future<List<Course>> getFavoriteCourses() async {
    try {
      final courses = await _localStorageDataSource.getCourses();
      return courses.where((course) => course.isFavorite == true).toList();
    } catch (e) {
      throw Exception('Error al obtener cursos favoritos: $e');
    }
  }

  @override
  Future<void> addToFavorites(Course course) async {
    try {
      final courses = await _localStorageDataSource.getCourses();
      final courseIndex = courses.indexWhere((c) => c.uid == course.uid);

      if (courseIndex != -1) {
        final updatedCourse = course.copyWith(isFavorite: true);
        courses[courseIndex] = updatedCourse;
      } else {
        final favoriteCourse = course.copyWith(isFavorite: true);
        courses.add(favoriteCourse);
      }

      await _localStorageDataSource.saveCourses(courses);
    } catch (e) {
      throw Exception('Error al agregar a favoritos: $e');
    }
  }

  @override
  Future<void> removeFromFavorites(String courseId) async {
    try {
      final courses = await _localStorageDataSource.getCourses();
      final courseIndex = courses.indexWhere((c) => c.uid == courseId);

      if (courseIndex != -1) {
        final updatedCourse = courses[courseIndex].copyWith(isFavorite: false);
        courses[courseIndex] = updatedCourse;
        await _localStorageDataSource.saveCourses(courses);
      }
    } catch (e) {
      throw Exception('Error al eliminar de favoritos: $e');
    }
  }

  @override
  Future<bool> isFavorite(String courseId) async {
    try {
      final courses = await _localStorageDataSource.getCourses();
      final course = courses.firstWhere(
        (c) => c.uid == courseId,
        orElse: () => const Course(
          summary: '',
          levels: [],
          roles: [],
          products: [],
          uid: '',
          type: '',
          title: '',
          durationInMinutes: 0,
          durationInHours: 0,
          iconUrl: '',
          locale: '',
          url: '',
        ),
      );
      return course.isFavorite;
    } catch (e) {
      throw Exception('Error al verificar favorito: $e');
    }
  }

  @override
  Future<void> clearFavorites() async {
    try {
      final courses = await _localStorageDataSource.getCourses();
      final updatedCourses = courses.map((course) => course.copyWith(isFavorite: false)).toList();
      await _localStorageDataSource.saveCourses(updatedCourses);
    } catch (e) {
      throw Exception('Error al limpiar favoritos: $e');
    }
  }
}
