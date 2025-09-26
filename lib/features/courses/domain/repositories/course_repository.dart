import '../entities/course.dart';

abstract class CourseRepository {
  Future<void> clearLocalCourses();

  Future<Course?> getCourseById(String id);

  Future<List<Course>> getCourses({
    int page = 1,
    int pageSize = 20,
    String? search,
    String? type,
    String? level,
    List<String>? products,
  });

  Future<List<Course>> getLocalCourses();

  Future<void> saveCoursesLocally(List<Course> courses);
}
