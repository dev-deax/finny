import 'package:equatable/equatable.dart';

import 'study_guide.dart';

class CourseInstructor extends Equatable {
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
  final List<StudyGuide> studyGuide;

  const CourseInstructor({
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

  CourseInstructor copyWith({
    String? uid,
    String? courseNumber,
    String? title,
    String? summary,
    int? durationInHours,
    String? url,
    String? iconUrl,
    List<String>? locales,
    String? type,
    String? certification,
    String? exam,
    List<String>? levels,
    List<String>? roles,
    List<String>? products,
    List<StudyGuide>? studyGuide,
  }) {
    return CourseInstructor(
      uid: uid ?? this.uid,
      courseNumber: courseNumber ?? this.courseNumber,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      durationInHours: durationInHours ?? this.durationInHours,
      url: url ?? this.url,
      iconUrl: iconUrl ?? this.iconUrl,
      locales: locales ?? this.locales,
      type: type ?? this.type,
      certification: certification ?? this.certification,
      exam: exam ?? this.exam,
      levels: levels ?? this.levels,
      roles: roles ?? this.roles,
      products: products ?? this.products,
      studyGuide: studyGuide ?? this.studyGuide,
    );
  }

  @override
  String toString() {
    return 'CourseInstructor(uid: $uid, courseNumber: $courseNumber, title: $title, summary: $summary, durationInHours: $durationInHours, url: $url, iconUrl: $iconUrl, locales: $locales, type: $type, certification: $certification, exam: $exam, levels: $levels, roles: $roles, products: $products, studyGuide: $studyGuide)';
  }
}
