import '../../domain/entities/unit.dart';
import '../models/api/unit_model.dart';

class UnitMapper {
  static Unit toDomain(UnitModel apiModel) {
    return Unit(
      uid: apiModel.uid,
      type: apiModel.type,
      title: apiModel.title,
      durationInMinutes: apiModel.durationInMinutes,
      locale: apiModel.locale,
      lastModified: apiModel.lastModified,
    );
  }

  static List<Unit> toDomainList(List<UnitModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
