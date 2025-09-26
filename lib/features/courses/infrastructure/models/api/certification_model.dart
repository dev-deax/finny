import 'package:equatable/equatable.dart';

import 'study_guide_model.dart';

class CertificationModel extends Equatable {
  final String uid;
  final String title;
  final String? subtitle;
  final String url;
  final String? iconUrl;
  final String type;
  final String certificationType;
  final List<String> exams;
  final List<String> levels;
  final List<String> roles;
  final List<StudyGuideModel> studyGuide;

  const CertificationModel({
    required this.uid,
    required this.title,
    this.subtitle,
    required this.url,
    this.iconUrl,
    required this.type,
    required this.certificationType,
    required this.exams,
    required this.levels,
    required this.roles,
    required this.studyGuide,
  });

  factory CertificationModel.fromJson(Map<String, dynamic> json) {
    final studyGuideList = json['study_guide'] as List<dynamic>? ?? [];

    return CertificationModel(
      uid: json['uid'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String?,
      url: json['url'] as String? ?? '',
      iconUrl: json['icon_url'] as String?,
      type: json['type'] as String? ?? '',
      certificationType: json['certification_type'] as String? ?? '',
      exams: (json['exams'] as List<dynamic>?)?.cast<String>() ?? [],
      levels: (json['levels'] as List<dynamic>?)?.cast<String>() ?? [],
      roles: (json['roles'] as List<dynamic>?)?.cast<String>() ?? [],
      studyGuide: studyGuideList.map((guideJson) => StudyGuideModel.fromJson(guideJson as Map<String, dynamic>)).toList(),
    );
  }

  @override
  List<Object?> get props => [
        uid,
        title,
        subtitle,
        url,
        iconUrl,
        type,
        certificationType,
        exams,
        levels,
        roles,
        studyGuide,
      ];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'subtitle': subtitle,
      'url': url,
      'icon_url': iconUrl,
      'type': type,
      'certification_type': certificationType,
      'exams': exams,
      'levels': levels,
      'roles': roles,
      'study_guide': studyGuide.map((guide) => guide.toJson()).toList(),
    };
  }
}
