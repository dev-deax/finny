import '../../domain/entities/certification.dart';
import '../../domain/entities/study_guide.dart';
import '../models/api/certification_model.dart';

class CertificationMapper {
  static Certification toDomain(CertificationModel apiModel) {
    return Certification(
      uid: apiModel.uid,
      title: apiModel.title,
      subtitle: apiModel.subtitle,
      url: apiModel.url,
      iconUrl: apiModel.iconUrl,
      type: apiModel.type,
      certificationType: apiModel.certificationType,
      exams: apiModel.exams,
      levels: apiModel.levels,
      roles: apiModel.roles,
      studyGuide: apiModel.studyGuide
          .map((guide) => StudyGuide(
                uid: guide.uid,
                type: guide.type,
              ))
          .toList(),
    );
  }

  static List<Certification> toDomainList(List<CertificationModel> apiModels) {
    return apiModels.map((apiModel) => toDomain(apiModel)).toList();
  }
}
