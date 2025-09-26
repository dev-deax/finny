import 'package:equatable/equatable.dart';

import 'study_guide.dart';

class AppliedSkill extends Equatable {
  final String uid;
  final String locale;
  final String url;
  final String title;
  final String summary;
  final List<String> levels;
  final List<String> roles;
  final List<String> products;
  final List<String> subjects;
  final List<StudyGuide> studyGuide;
  final String lastModified;

  const AppliedSkill({
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

  AppliedSkill copyWith({
    String? uid,
    String? locale,
    String? url,
    String? title,
    String? summary,
    List<String>? levels,
    List<String>? roles,
    List<String>? products,
    List<String>? subjects,
    List<StudyGuide>? studyGuide,
    String? lastModified,
  }) {
    return AppliedSkill(
      uid: uid ?? this.uid,
      locale: locale ?? this.locale,
      url: url ?? this.url,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      levels: levels ?? this.levels,
      roles: roles ?? this.roles,
      products: products ?? this.products,
      subjects: subjects ?? this.subjects,
      studyGuide: studyGuide ?? this.studyGuide,
      lastModified: lastModified ?? this.lastModified,
    );
  }

  @override
  String toString() {
    return 'AppliedSkill(uid: $uid, locale: $locale, url: $url, title: $title, summary: $summary, levels: $levels, roles: $roles, products: $products, subjects: $subjects, studyGuide: $studyGuide, lastModified: $lastModified)';
  }
}
