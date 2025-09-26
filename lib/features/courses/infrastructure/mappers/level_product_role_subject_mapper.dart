import '../../domain/entities/level_product_role_subject.dart';
import '../models/api/level_product_role_subject_model.dart';

class LevelProductRoleSubjectMapper {
  static LevelProductRoleSubject toDomain(LevelProductRoleSubjectModel apiModel) {
    return LevelProductRoleSubject(
      id: apiModel.id,
      name: apiModel.name,
      children: apiModel.children.map((child) => toDomain(child)).toList(),
    );
  }

  static List<LevelProductRoleSubject> toDomainList(List<LevelProductRoleSubjectModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
