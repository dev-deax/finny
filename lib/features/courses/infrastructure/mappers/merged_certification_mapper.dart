import '../../domain/entities/merged_certification.dart';
import '../models/api/merged_certification_model.dart';

class MergedCertificationMapper {
  static MergedCertification toDomain(MergedCertificationModel apiModel) {
    return MergedCertification(
      uid: apiModel.uid,
      title: apiModel.title,
      summary: apiModel.summary,
      url: apiModel.url,
      iconUrl: apiModel.iconUrl,
      lastModified: apiModel.lastModified,
      type: apiModel.type,
      certificationType: apiModel.certificationType,
      products: apiModel.products,
      levels: apiModel.levels,
      roles: apiModel.roles,
      subjects: apiModel.subjects,
      renewalFrequencyInDays: apiModel.renewalFrequencyInDays,
      prerequisites: apiModel.prerequisites,
      skills: apiModel.skills,
      recommendationList: apiModel.recommendationList,
      studyGuide: apiModel.studyGuide,
      examDurationInMinutes: apiModel.examDurationInMinutes,
      locales: apiModel.locales,
      providers: apiModel.providers,
      careerPaths: apiModel.careerPaths,
    );
  }

  static List<MergedCertification> toDomainList(List<MergedCertificationModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
