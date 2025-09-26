import 'package:equatable/equatable.dart';

class MergedCertificationModel extends Equatable {
  final String uid;
  final String title;
  final String summary;
  final String url;
  final String? iconUrl;
  final String lastModified;
  final String type;
  final String certificationType;
  final List<String> products;
  final List<String> levels;
  final List<String> roles;
  final List<String> subjects;
  final int renewalFrequencyInDays;
  final List<String> prerequisites;
  final List<String> skills;
  final List<String> recommendationList;
  final List<String> studyGuide;
  final int examDurationInMinutes;
  final List<String> locales;
  final List<String> providers;
  final List<String> careerPaths;

  const MergedCertificationModel({
    required this.uid,
    required this.title,
    required this.summary,
    required this.url,
    this.iconUrl,
    required this.lastModified,
    required this.type,
    required this.certificationType,
    required this.products,
    required this.levels,
    required this.roles,
    required this.subjects,
    required this.renewalFrequencyInDays,
    required this.prerequisites,
    required this.skills,
    required this.recommendationList,
    required this.studyGuide,
    required this.examDurationInMinutes,
    required this.locales,
    required this.providers,
    required this.careerPaths,
  });

  factory MergedCertificationModel.fromJson(Map<String, dynamic> json) {
    return MergedCertificationModel(
      uid: json['uid'] as String? ?? '',
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      url: json['url'] as String? ?? '',
      iconUrl: json['icon_url'] as String?,
      lastModified: json['last_modified'] as String? ?? '',
      type: json['type'] as String? ?? '',
      certificationType: json['certification_type'] as String? ?? '',
      products: (json['products'] as List<dynamic>?)?.cast<String>() ?? [],
      levels: (json['levels'] as List<dynamic>?)?.cast<String>() ?? [],
      roles: (json['roles'] as List<dynamic>?)?.cast<String>() ?? [],
      subjects: (json['subjects'] as List<dynamic>?)?.cast<String>() ?? [],
      renewalFrequencyInDays: json['renewal_frequency_in_days'] as int? ?? 0,
      prerequisites: (json['prerequisites'] as List<dynamic>?)?.cast<String>() ?? [],
      skills: (json['skills'] as List<dynamic>?)?.cast<String>() ?? [],
      recommendationList: (json['recommendation_list'] as List<dynamic>?)?.cast<String>() ?? [],
      studyGuide: (json['study_guide'] as List<dynamic>?)?.cast<String>() ?? [],
      examDurationInMinutes: json['exam_duration_in_minutes'] as int? ?? 0,
      locales: (json['locales'] as List<dynamic>?)?.cast<String>() ?? [],
      providers: (json['providers'] as List<dynamic>?)?.cast<String>() ?? [],
      careerPaths: (json['career_paths'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }

  @override
  List<Object?> get props => [
        uid,
        title,
        summary,
        url,
        iconUrl,
        lastModified,
        type,
        certificationType,
        products,
        levels,
        roles,
        subjects,
        renewalFrequencyInDays,
        prerequisites,
        skills,
        recommendationList,
        studyGuide,
        examDurationInMinutes,
        locales,
        providers,
        careerPaths,
      ];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'summary': summary,
      'url': url,
      'icon_url': iconUrl,
      'last_modified': lastModified,
      'type': type,
      'certification_type': certificationType,
      'products': products,
      'levels': levels,
      'roles': roles,
      'subjects': subjects,
      'renewal_frequency_in_days': renewalFrequencyInDays,
      'prerequisites': prerequisites,
      'skills': skills,
      'recommendation_list': recommendationList,
      'study_guide': studyGuide,
      'exam_duration_in_minutes': examDurationInMinutes,
      'locales': locales,
      'providers': providers,
      'career_paths': careerPaths,
    };
  }
}
