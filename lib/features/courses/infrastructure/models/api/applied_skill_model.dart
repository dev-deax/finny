import 'package:equatable/equatable.dart';

import 'study_guide_model.dart';

class AppliedSkillModel extends Equatable {
  final String uid;
  final String locale;
  final String url;
  final String title;
  final String summary;
  final List<String> levels;
  final List<String> roles;
  final List<String> products;
  final List<String> subjects;
  final List<StudyGuideModel> studyGuide;
  final String lastModified;

  const AppliedSkillModel({
    required this.uid,
    required this.locale,
    required this.url,
    required this.title,
    required this.summary,
    required this.levels,
    required this.roles,
    required this.products,
    required this.subjects,
    required this.studyGuide,
    required this.lastModified,
  });

  factory AppliedSkillModel.fromJson(Map<String, dynamic> json) {
    final studyGuideList = json['study_guide'] as List<dynamic>? ?? [];

    return AppliedSkillModel(
      uid: json['uid'] as String? ?? '',
      locale: json['locale'] as String? ?? '',
      url: json['url'] as String? ?? '',
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      levels: (json['levels'] as List<dynamic>?)?.cast<String>() ?? [],
      roles: (json['roles'] as List<dynamic>?)?.cast<String>() ?? [],
      products: (json['products'] as List<dynamic>?)?.cast<String>() ?? [],
      subjects: (json['subjects'] as List<dynamic>?)?.cast<String>() ?? [],
      studyGuide: studyGuideList.map((guideJson) => StudyGuideModel.fromJson(guideJson as Map<String, dynamic>)).toList(),
      lastModified: json['last_modified'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [
        uid,
        locale,
        url,
        title,
        summary,
        levels,
        roles,
        products,
        subjects,
        studyGuide,
        lastModified,
      ];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'locale': locale,
      'url': url,
      'title': title,
      'summary': summary,
      'levels': levels,
      'roles': roles,
      'products': products,
      'subjects': subjects,
      'study_guide': studyGuide.map((guide) => guide.toJson()).toList(),
      'last_modified': lastModified,
    };
  }
}
