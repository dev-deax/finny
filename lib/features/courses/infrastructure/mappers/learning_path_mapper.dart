import '../../domain/entities/learning_path.dart';
import '../models/api/learning_path_model.dart';

class LearningPathMapper {
  static LearningPath toDomain(LearningPathModel apiModel) {
    return LearningPath(
      summary: apiModel.summary,
      levels: apiModel.levels,
      roles: apiModel.roles,
      products: apiModel.products,
      subjects: apiModel.subjects,
      uid: apiModel.uid,
      type: apiModel.type,
      title: apiModel.title,
      durationInMinutes: apiModel.durationInMinutes,
      rating: apiModel.rating != null
          ? LearningPathRating(
              count: apiModel.rating!.count,
              average: apiModel.rating!.average,
            )
          : null,
      popularity: apiModel.popularity,
      iconUrl: apiModel.iconUrl,
      socialImageUrl: apiModel.socialImageUrl,
      locale: apiModel.locale,
      lastModified: apiModel.lastModified,
      url: apiModel.url,
      firstModuleUrl: apiModel.firstModuleUrl,
      modules: apiModel.modules,
      numberOfChildren: apiModel.numberOfChildren,
    );
  }

  static List<LearningPath> toDomainList(List<LearningPathModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
