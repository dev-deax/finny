import 'package:equatable/equatable.dart';

import 'course_rating_model.dart';

class CourseApiModel extends Equatable {
  final String summary;
  final List<String> levels;
  final List<String> roles;
  final List<String> products;
  final String uid;
  final String type;
  final String title;
  final int durationInMinutes;
  final CourseRatingModel rating;
  final double popularity;
  final String iconUrl;
  final String socialImageUrl;
  final String locale;
  final String lastModified;
  final String url;
  final String firstUnitUrl;
  final List<String> units;
  final int numberOfChildren;

  const CourseApiModel({
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

  factory CourseApiModel.fromJson(Map<String, dynamic> json) => CourseApiModel(
        summary: json['summary'] as String? ?? '',
        levels: json['levels'] != null ? List<String>.from(json['levels'] as List) : [],
        roles: json['roles'] != null ? List<String>.from(json['roles'] as List) : [],
        products: json['products'] != null ? List<String>.from(json['products'] as List) : [],
        uid: json['uid'] as String? ?? '',
        type: json['type'] as String? ?? '',
        title: json['title'] as String? ?? '',
        durationInMinutes: json['duration_in_minutes'] as int? ?? 0,
        rating: json['rating'] != null ? CourseRatingModel.fromJson(json['rating'] as Map<String, dynamic>) : const CourseRatingModel(count: 0, average: 0.0),
        popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
        iconUrl: json['icon_url'] as String? ?? '',
        socialImageUrl: json['social_image_url'] as String? ?? '',
        locale: json['locale'] as String? ?? '',
        lastModified: json['last_modified'] as String? ?? '',
        url: json['url'] as String? ?? '',
        firstUnitUrl: json['firstUnitUrl'] as String? ?? '',
        units: json['units'] != null ? List<String>.from(json['units'] as List) : [],
        numberOfChildren: json['number_of_children'] as int? ?? 0,
      );

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

  Map<String, dynamic> toJson() {
    return {
      'summary': summary,
      'levels': levels,
      'roles': roles,
      'products': products,
      'uid': uid,
      'type': type,
      'title': title,
      'duration_in_minutes': durationInMinutes,
      'rating': rating.toJson(),
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
