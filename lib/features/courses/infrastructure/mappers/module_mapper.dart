import 'package:finny/features/courses/domain/entities/module.dart';
import 'package:finny/features/courses/infrastructure/models/api/module_model.dart';

class ModuleMapper {
  static Module toDomain(ModuleModel apiModel) {
    return Module(
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
          ? ModuleRating(
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
      firstUnitUrl: apiModel.firstUnitUrl,
      units: apiModel.units,
      numberOfChildren: apiModel.numberOfChildren,
    );
  }

  static List<Module> toDomainList(List<ModuleModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
