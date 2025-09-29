import '../entities/course.dart';

abstract class CourseRepository {
  Future<Course?> getCourseById(String id);

  Future<List<Course>> getCourses({
    int page = 1,
    int pageSize = 20,
    String? search,
    String? type,
    String? level,
    List<String>? products,
    List<String>? roles,
    List<String>? subjects,
  });
}
