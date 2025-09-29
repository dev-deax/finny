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
  final int durationInHours;
  final String iconUrl;
  final String locale;
  final String url;
  final bool isFavorite;

  const Course({
    required this.summary,
    required this.levels,
    required this.roles,
    required this.products,
    required this.uid,
    required this.type,
    required this.title,
    required this.durationInMinutes,
    required this.durationInHours,
    required this.iconUrl,
    required this.locale,
    required this.url,
    this.isFavorite = false,
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
        durationInHours,
        iconUrl,
        locale,
        url,
        isFavorite,
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
    int? durationInHours,
    String? iconUrl,
    String? locale,
    String? url,
    bool? isFavorite,
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
      durationInHours: durationInHours ?? this.durationInHours,
      iconUrl: iconUrl ?? this.iconUrl,
      locale: locale ?? this.locale,
      url: url ?? this.url,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  String toString() {
    return 'Course(summary: $summary, levels: $levels, roles: $roles, products: $products, uid: $uid, type: $type, title: $title, durationInMinutes: $durationInMinutes, iconUrl: $iconUrl, locale: $locale, url: $url, isFavorite: $isFavorite)';
  }
}
