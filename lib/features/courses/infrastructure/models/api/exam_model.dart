import 'package:equatable/equatable.dart';

import 'study_guide_model.dart';

class ExamModel extends Equatable {
  final String uid;
  final String title;
  final String? subtitle;
  final String displayName;
  final String url;
  final String? iconUrl;
  final String? pdfDownloadUrl;
  final String? practiceTestUrl;
  final String? practiceAssessmentUrl;
  final List<String> locales;
  final String type;
  final List<String> courses;
  final List<String> levels;
  final List<String> roles;
  final List<String> products;
  final List<String> providers;
  final List<StudyGuideModel> studyGuide;

  const ExamModel({
    required this.uid,
    required this.title,
    this.subtitle,
    required this.displayName,
    required this.url,
    this.iconUrl,
    this.pdfDownloadUrl,
    this.practiceTestUrl,
    this.practiceAssessmentUrl,
    required this.locales,
    required this.type,
    required this.courses,
    required this.levels,
    required this.roles,
    required this.products,
    required this.providers,
    required this.studyGuide,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    final studyGuideList = json['study_guide'] as List<dynamic>? ?? [];

    return ExamModel(
      uid: json['uid'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String?,
      displayName: json['display_name'] as String? ?? '',
      url: json['url'] as String? ?? '',
      iconUrl: json['icon_url'] as String?,
      pdfDownloadUrl: json['pdf_download_url'] as String?,
      practiceTestUrl: json['practice_test_url'] as String?,
      practiceAssessmentUrl: json['practice_assessment_url'] as String?,
      locales: (json['locales'] as List<dynamic>?)?.cast<String>() ?? [],
      type: json['type'] as String? ?? '',
      courses: (json['courses'] as List<dynamic>?)?.cast<String>() ?? [],
      levels: (json['levels'] as List<dynamic>?)?.cast<String>() ?? [],
      roles: (json['roles'] as List<dynamic>?)?.cast<String>() ?? [],
      products: (json['products'] as List<dynamic>?)?.cast<String>() ?? [],
      providers: (json['providers'] as List<dynamic>?)?.cast<String>() ?? [],
      studyGuide: studyGuideList.map((guideJson) => StudyGuideModel.fromJson(guideJson as Map<String, dynamic>)).toList(),
    );
  }

  @override
  List<Object?> get props => [
        uid,
        title,
        subtitle,
        displayName,
        url,
        iconUrl,
        pdfDownloadUrl,
        practiceTestUrl,
        practiceAssessmentUrl,
        locales,
        type,
        courses,
        levels,
        roles,
        products,
        providers,
        studyGuide,
      ];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'subtitle': subtitle,
      'display_name': displayName,
      'url': url,
      'icon_url': iconUrl,
      'pdf_download_url': pdfDownloadUrl,
      'practice_test_url': practiceTestUrl,
      'practice_assessment_url': practiceAssessmentUrl,
      'locales': locales,
      'type': type,
      'courses': courses,
      'levels': levels,
      'roles': roles,
      'products': products,
      'providers': providers,
      'study_guide': studyGuide.map((guide) => guide.toJson()).toList(),
    };
  }
}
