import 'package:equatable/equatable.dart';

class MergedCertification extends Equatable {
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

  const MergedCertification({
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

  MergedCertification copyWith({
    String? uid,
    String? title,
    String? summary,
    String? url,
    String? iconUrl,
    String? lastModified,
    String? type,
    String? certificationType,
    List<String>? products,
    List<String>? levels,
    List<String>? roles,
    List<String>? subjects,
    int? renewalFrequencyInDays,
    List<String>? prerequisites,
    List<String>? skills,
    List<String>? recommendationList,
    List<String>? studyGuide,
    int? examDurationInMinutes,
    List<String>? locales,
    List<String>? providers,
    List<String>? careerPaths,
  }) {
    return MergedCertification(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      url: url ?? this.url,
      iconUrl: iconUrl ?? this.iconUrl,
      lastModified: lastModified ?? this.lastModified,
      type: type ?? this.type,
      certificationType: certificationType ?? this.certificationType,
      products: products ?? this.products,
      levels: levels ?? this.levels,
      roles: roles ?? this.roles,
      subjects: subjects ?? this.subjects,
      renewalFrequencyInDays: renewalFrequencyInDays ?? this.renewalFrequencyInDays,
      prerequisites: prerequisites ?? this.prerequisites,
      skills: skills ?? this.skills,
      recommendationList: recommendationList ?? this.recommendationList,
      studyGuide: studyGuide ?? this.studyGuide,
      examDurationInMinutes: examDurationInMinutes ?? this.examDurationInMinutes,
      locales: locales ?? this.locales,
      providers: providers ?? this.providers,
      careerPaths: careerPaths ?? this.careerPaths,
    );
  }

  @override
  String toString() {
    return 'MergedCertification(uid: $uid, title: $title, summary: $summary, url: $url, iconUrl: $iconUrl, lastModified: $lastModified, type: $type, certificationType: $certificationType, products: $products, levels: $levels, roles: $roles, subjects: $subjects, renewalFrequencyInDays: $renewalFrequencyInDays, prerequisites: $prerequisites, skills: $skills, recommendationList: $recommendationList, studyGuide: $studyGuide, examDurationInMinutes: $examDurationInMinutes, locales: $locales, providers: $providers, careerPaths: $careerPaths)';
  }
}
