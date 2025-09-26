import 'package:equatable/equatable.dart';

import 'study_guide.dart';

class Certification extends Equatable {
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
  final List<StudyGuide> studyGuide;

  const Certification({
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

  Certification copyWith({
    String? uid,
    String? title,
    String? subtitle,
    String? url,
    String? iconUrl,
    String? type,
    String? certificationType,
    List<String>? exams,
    List<String>? levels,
    List<String>? roles,
    List<StudyGuide>? studyGuide,
  }) {
    return Certification(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      url: url ?? this.url,
      iconUrl: iconUrl ?? this.iconUrl,
      type: type ?? this.type,
      certificationType: certificationType ?? this.certificationType,
      exams: exams ?? this.exams,
      levels: levels ?? this.levels,
      roles: roles ?? this.roles,
      studyGuide: studyGuide ?? this.studyGuide,
    );
  }

  @override
  String toString() {
    return 'Certification(uid: $uid, title: $title, subtitle: $subtitle, url: $url, iconUrl: $iconUrl, type: $type, certificationType: $certificationType, exams: $exams, levels: $levels, roles: $roles, studyGuide: $studyGuide)';
  }
}
