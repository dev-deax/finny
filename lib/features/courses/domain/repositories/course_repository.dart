import '../entities/module.dart';

abstract class CourseRepository {
  Future<void> clearLocalCourses();

  Future<Module?> getCourseById(String id);

  Future<List<Module>> getCourses({
    int page = 1,
    int pageSize = 20,
    String? search,
    String? type,
    String? level,
    List<String>? products,
  });

  Future<List<Module>> getLocalCourses();

  Future<void> saveCoursesLocally(List<Module> courses);
}
