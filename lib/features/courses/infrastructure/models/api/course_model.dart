import 'package:equatable/equatable.dart';

import 'study_guide_model.dart';

class CourseModel extends Equatable {
  final String uid;
  final String courseNumber;
  final String title;
  final String summary;
  final int durationInHours;
  final String url;
  final String? iconUrl;
  final List<String> locales;
  final String type;
  final String? certification;
  final String? exam;
  final List<String> levels;
  final List<String> roles;
  final List<String> products;
  final List<StudyGuideModel> studyGuide;

  const CourseModel({
    required this.uid,
    required this.courseNumber,
    required this.title,
    required this.summary,
    required this.durationInHours,
    required this.url,
    this.iconUrl,
    required this.locales,
    required this.type,
    this.certification,
    this.exam,
    required this.levels,
    required this.roles,
    required this.products,
    required this.studyGuide,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    final studyGuideList = json['study_guide'] as List<dynamic>? ?? [];

    return CourseModel(
      uid: json['uid'] as String? ?? '',
      courseNumber: json['course_number'] as String? ?? '',
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      durationInHours: json['duration_in_hours'] as int? ?? 0,
      url: json['url'] as String? ?? '',
      iconUrl: json['icon_url'] as String?,
      locales: (json['locales'] as List<dynamic>?)?.cast<String>() ?? [],
      type: json['type'] as String? ?? '',
      certification: json['certification'] as String?,
      exam: json['exam'] as String?,
      levels: (json['levels'] as List<dynamic>?)?.cast<String>() ?? [],
      roles: (json['roles'] as List<dynamic>?)?.cast<String>() ?? [],
      products: (json['products'] as List<dynamic>?)?.cast<String>() ?? [],
      studyGuide: studyGuideList.map((guideJson) => StudyGuideModel.fromJson(guideJson as Map<String, dynamic>)).toList(),
    );
  }

  @override
  List<Object?> get props => [
        uid,
        courseNumber,
        title,
        summary,
        durationInHours,
        url,
        iconUrl,
        locales,
        type,
        certification,
        exam,
        levels,
        roles,
        products,
        studyGuide,
      ];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'course_number': courseNumber,
      'title': title,
      'summary': summary,
      'duration_in_hours': durationInHours,
      'url': url,
      'icon_url': iconUrl,
      'locales': locales,
      'type': type,
      'certification': certification,
      'exam': exam,
      'levels': levels,
      'roles': roles,
      'products': products,
      'study_guide': studyGuide.map((guide) => guide.toJson()).toList(),
    };
  }
}
