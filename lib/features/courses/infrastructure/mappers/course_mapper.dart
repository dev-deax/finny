import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:finny/features/courses/infrastructure/models/api/course_model.dart';

class CourseMapper {
  static Course toDomain(CourseModel apiModel) {
  
  }

  static List<Course> toDomainList(List<CourseModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
