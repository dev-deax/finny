import 'package:equatable/equatable.dart';

import 'study_guide.dart';

class Exam extends Equatable {
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
  final List<StudyGuide> studyGuide;

  const Exam({
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

  Exam copyWith({
    String? uid,
    String? title,
    String? subtitle,
    String? displayName,
    String? url,
    String? iconUrl,
    String? pdfDownloadUrl,
    String? practiceTestUrl,
    String? practiceAssessmentUrl,
    List<String>? locales,
    String? type,
    List<String>? courses,
    List<String>? levels,
    List<String>? roles,
    List<String>? products,
    List<String>? providers,
    List<StudyGuide>? studyGuide,
  }) {
    return Exam(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      displayName: displayName ?? this.displayName,
      url: url ?? this.url,
      iconUrl: iconUrl ?? this.iconUrl,
      pdfDownloadUrl: pdfDownloadUrl ?? this.pdfDownloadUrl,
      practiceTestUrl: practiceTestUrl ?? this.practiceTestUrl,
      practiceAssessmentUrl: practiceAssessmentUrl ?? this.practiceAssessmentUrl,
      locales: locales ?? this.locales,
      type: type ?? this.type,
      courses: courses ?? this.courses,
      levels: levels ?? this.levels,
      roles: roles ?? this.roles,
      products: products ?? this.products,
      providers: providers ?? this.providers,
      studyGuide: studyGuide ?? this.studyGuide,
    );
  }

  @override
  String toString() {
    return 'Exam(uid: $uid, title: $title, subtitle: $subtitle, displayName: $displayName, url: $url, iconUrl: $iconUrl, pdfDownloadUrl: $pdfDownloadUrl, practiceTestUrl: $practiceTestUrl, practiceAssessmentUrl: $practiceAssessmentUrl, locales: $locales, type: $type, courses: $courses, levels: $levels, roles: $roles, products: $products, providers: $providers, studyGuide: $studyGuide)';
  }
}
