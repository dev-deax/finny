import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String summary;
  final List<String> levels;
  final List<String> roles;
  final List<String> products;
  final String uid;
  final String type;
  final String title;
  final int durationInMinutes;
  final CourseRating rating;
  final double popularity;
  final String iconUrl;
  final String socialImageUrl;
  final String locale;
  final String lastModified;
  final String url;
  final String firstUnitUrl;
  final List<String> units;
  final int numberOfChildren;

  const Course({
    required this.summary,
    required this.levels,
    required this.roles,
    required this.products,
    required this.uid,
    required this.type,
    required this.title,
    required this.durationInMinutes,
    required this.rating,
    required this.popularity,
    required this.iconUrl,
    required this.socialImageUrl,
    required this.locale,
    required this.lastModified,
    required this.url,
    required this.firstUnitUrl,
    required this.units,
    required this.numberOfChildren,
  });

  @override
  List<Object?> get props => [
        summary,
        levels,
        roles,
        products,
        uid,
        type,
        title,
        durationInMinutes,
        rating,
        popularity,
        iconUrl,
        socialImageUrl,
        locale,
        lastModified,
        url,
        firstUnitUrl,
        units,
        numberOfChildren,
      ];

  Course copyWith({
    String? summary,
    List<String>? levels,
    List<String>? roles,
    List<String>? products,
    String? uid,
    String? type,
    String? title,
    int? durationInMinutes,
    CourseRating? rating,
    double? popularity,
    String? iconUrl,
    String? socialImageUrl,
    String? locale,
    String? lastModified,
    String? url,
    String? firstUnitUrl,
    List<String>? units,
    int? numberOfChildren,
  }) {
    return Course(
      summary: summary ?? this.summary,
      levels: levels ?? this.levels,
      roles: roles ?? this.roles,
      products: products ?? this.products,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      title: title ?? this.title,
      durationInMinutes: durationInMinutes ?? this.durationInMinutes,
      rating: rating ?? this.rating,
      popularity: popularity ?? this.popularity,
      iconUrl: iconUrl ?? this.iconUrl,
      socialImageUrl: socialImageUrl ?? this.socialImageUrl,
      locale: locale ?? this.locale,
      lastModified: lastModified ?? this.lastModified,
      url: url ?? this.url,
      firstUnitUrl: firstUnitUrl ?? this.firstUnitUrl,
      units: units ?? this.units,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
    );
  }

  @override
  String toString() {
    return 'Course(summary: $summary, levels: $levels, roles: $roles, products: $products, uid: $uid, type: $type, title: $title, durationInMinutes: $durationInMinutes, rating: $rating, popularity: $popularity, iconUrl: $iconUrl, socialImageUrl: $socialImageUrl, locale: $locale, lastModified: $lastModified, url: $url, firstUnitUrl: $firstUnitUrl, units: $units, numberOfChildren: $numberOfChildren)';
  }
}

enum CourseLevel {
  beginner('Principiante'),
  intermediate('Intermedio'),
  advanced('Avanzado');

  final String displayName;
  const CourseLevel(this.displayName);
}

class CourseRating extends Equatable {
  final int count;
  final double average;

  const CourseRating({
    required this.count,
    required this.average,
  });

  @override
  List<Object?> get props => [count, average];
}

enum CourseType {
  module('Módulo'),
  learningPath('Ruta de Aprendizaje'),
  certification('Certificación'),
  exam('Examen');

  final String displayName;
  const CourseType(this.displayName);
}
