import '../../domain/entities/applied_skill.dart';
import '../../domain/entities/study_guide.dart';
import '../models/api/applied_skill_model.dart';

class AppliedSkillMapper {
  static AppliedSkill toDomain(AppliedSkillModel apiModel) {
    return AppliedSkill(
      uid: apiModel.uid,
      locale: apiModel.locale,
      url: apiModel.url,
      title: apiModel.title,
      summary: apiModel.summary,
      levels: apiModel.levels,
      roles: apiModel.roles,
      products: apiModel.products,
      subjects: apiModel.subjects,
      studyGuide: apiModel.studyGuide
          .map((guide) => StudyGuide(
                uid: guide.uid,
                type: guide.type,
              ))
          .toList(),
      lastModified: apiModel.lastModified,
    );
  }

  static List<AppliedSkill> toDomainList(List<AppliedSkillModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
