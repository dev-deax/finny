import 'package:equatable/equatable.dart';

import 'rating_model.dart';

class ModuleModel extends Equatable {
  final String summary;
  final List<String> levels;
  final List<String> roles;
  final List<String> products;
  final List<String> subjects;
  final String uid;
  final String type;
  final String title;
  final int durationInMinutes;
  final RatingModel? rating;
  final double popularity;
  final String? iconUrl;
  final String? socialImageUrl;
  final String locale;
  final String lastModified;
  final String url;
  final String? firstUnitUrl;
  final List<String> units;
  final int numberOfChildren;

  const ModuleModel({
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
    this.firstUnitUrl,
    required this.units,
    required this.numberOfChildren,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    final ratingJson = json['rating'] as Map<String, dynamic>?;

    return ModuleModel(
      summary: json['summary'] as String? ?? '',
      levels: (json['levels'] as List<dynamic>?)?.cast<String>() ?? [],
      roles: (json['roles'] as List<dynamic>?)?.cast<String>() ?? [],
      products: (json['products'] as List<dynamic>?)?.cast<String>() ?? [],
      subjects: (json['subjects'] as List<dynamic>?)?.cast<String>() ?? [],
      uid: json['uid'] as String? ?? '',
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      durationInMinutes: json['duration_in_minutes'] as int? ?? 0,
      rating: ratingJson != null ? RatingModel.fromJson(ratingJson) : null,
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      iconUrl: json['icon_url'] as String?,
      socialImageUrl: json['social_image_url'] as String?,
      locale: json['locale'] as String? ?? '',
      lastModified: json['last_modified'] as String? ?? '',
      url: json['url'] as String? ?? '',
      firstUnitUrl: json['firstUnitUrl'] as String?,
      units: (json['units'] as List<dynamic>?)?.cast<String>() ?? [],
      numberOfChildren: json['number_of_children'] as int? ?? 0,
    );
  }

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
        firstUnitUrl,
        units,
        numberOfChildren,
      ];

  Map<String, dynamic> toJson() {
    return {
      'summary': summary,
      'levels': levels,
      'roles': roles,
      'products': products,
      'subjects': subjects,
      'uid': uid,
      'type': type,
      'title': title,
      'duration_in_minutes': durationInMinutes,
      'rating': rating?.toJson(),
      'popularity': popularity,
      'icon_url': iconUrl,
      'social_image_url': socialImageUrl,
      'locale': locale,
      'last_modified': lastModified,
      'url': url,
      'firstUnitUrl': firstUnitUrl,
      'units': units,
      'number_of_children': numberOfChildren,
    };
  }
}
