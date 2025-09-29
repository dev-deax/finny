import 'package:finny/core/extensions/string_extensions.dart';
import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:finny/features/courses/infrastructure/models/api/course_model.dart';

class CourseMapper {
  static Course toDomain(CourseModel apiModel) {
    return Course(
      summary: apiModel.summary.clearHtml,
      levels: apiModel.levels,
      roles: apiModel.roles,
      products: apiModel.products,
      uid: apiModel.uid,
      type: apiModel.type,
      title: apiModel.title,
      durationInMinutes: apiModel.durationInHours * 60,
      durationInHours: apiModel.durationInHours,
      iconUrl: apiModel.iconUrl ?? '',
      locale: apiModel.locales.isNotEmpty ? apiModel.locales.first : '',
      url: apiModel.url,
    );
  }

  static List<Course> toDomainList(List<CourseModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
