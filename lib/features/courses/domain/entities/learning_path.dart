import 'package:equatable/equatable.dart';

class LearningPath extends Equatable {
  final String summary;
  final List<String> levels;
  final List<String> roles;
  final List<String> products;
  final List<String> subjects;
  final String uid;
  final String type;
  final String title;
  final int durationInMinutes;
  final LearningPathRating? rating;
  final double popularity;
  final String? iconUrl;
  final String? socialImageUrl;
  final String locale;
  final String lastModified;
  final String url;
  final String? firstModuleUrl;
  final List<String> modules;
  final int numberOfChildren;

  const LearningPath({
    required this.summary,
    required this.levels,
    required this.roles,
    required this.products,
    required this.subjects,
    required this.uid,
    required this.type,
    required this.title,
    required this.durationInMinutes,
    this.rating,
    required this.popularity,
    this.iconUrl,
    this.socialImageUrl,
    required this.locale,
    required this.lastModified,
    required this.url,
    this.firstModuleUrl,
    required this.modules,
    required this.numberOfChildren,
  });

  @override
  List<Object?> get props => [
        summary,
        levels,
        roles,
        products,
        subjects,
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
        firstModuleUrl,
        modules,
        numberOfChildren,
      ];

  LearningPath copyWith({
    String? summary,
    List<String>? levels,
    List<String>? roles,
    List<String>? products,
    List<String>? subjects,
    String? uid,
    String? type,
    String? title,
    int? durationInMinutes,
    LearningPathRating? rating,
    double? popularity,
    String? iconUrl,
    String? socialImageUrl,
    String? locale,
    String? lastModified,
    String? url,
    String? firstModuleUrl,
    List<String>? modules,
    int? numberOfChildren,
  }) {
    return LearningPath(
      summary: summary ?? this.summary,
      levels: levels ?? this.levels,
      roles: roles ?? this.roles,
      products: products ?? this.products,
      subjects: subjects ?? this.subjects,
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
      firstModuleUrl: firstModuleUrl ?? this.firstModuleUrl,
      modules: modules ?? this.modules,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
    );
  }

  @override
  String toString() {
    return 'LearningPath(summary: $summary, levels: $levels, roles: $roles, products: $products, subjects: $subjects, uid: $uid, type: $type, title: $title, durationInMinutes: $durationInMinutes, rating: $rating, popularity: $popularity, iconUrl: $iconUrl, socialImageUrl: $socialImageUrl, locale: $locale, lastModified: $lastModified, url: $url, firstModuleUrl: $firstModuleUrl, modules: $modules, numberOfChildren: $numberOfChildren)';
  }
}

class LearningPathRating extends Equatable {
  final int count;
  final double average;

  const LearningPathRating({
    required this.count,
    required this.average,
  });

  @override
  List<Object?> get props => [count, average];
}
