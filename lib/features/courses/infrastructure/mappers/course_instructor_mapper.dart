import '../../domain/entities/course_instructor.dart';
import '../../domain/entities/study_guide.dart';
import '../models/api/course_model.dart';

class CourseInstructorMapper {
  static CourseInstructor toDomain(CourseModel apiModel) {
    return CourseInstructor(
      uid: apiModel.uid,
      courseNumber: apiModel.courseNumber,
      title: apiModel.title,
      summary: apiModel.summary,
      durationInHours: apiModel.durationInHours,
      url: apiModel.url,
      iconUrl: apiModel.iconUrl,
      locales: apiModel.locales,
      type: apiModel.type,
      certification: apiModel.certification,
      exam: apiModel.exam,
      levels: apiModel.levels,
      roles: apiModel.roles,
      products: apiModel.products,
      studyGuide: apiModel.studyGuide
          .map((guide) => StudyGuide(
                uid: guide.uid,
                type: guide.type,
              ))
          .toList(),
    );
  }

  static List<CourseInstructor> toDomainList(List<CourseModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
