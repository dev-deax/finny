import '../../domain/entities/course.dart';
import '../models/api/course_api_model.dart';

class CourseMapper {
  static Course toDomain(CourseApiModel apiModel) {
    return Course(
      summary: apiModel.summary,
      levels: apiModel.levels,
      roles: apiModel.roles,
      products: apiModel.products,
      uid: apiModel.uid,
      type: apiModel.type,
      title: apiModel.title,
      durationInMinutes: apiModel.durationInMinutes,
      rating: CourseRating(
        count: apiModel.rating.count,
        average: apiModel.rating.average,
      ),
      popularity: apiModel.popularity,
      iconUrl: apiModel.iconUrl,
      socialImageUrl: apiModel.socialImageUrl,
      locale: apiModel.locale,
      lastModified: apiModel.lastModified,
      url: apiModel.url,
      firstUnitUrl: apiModel.firstUnitUrl,
      units: apiModel.units,
      numberOfChildren: apiModel.numberOfChildren,
    );
  }

  static List<Course> toDomainList(List<CourseApiModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
