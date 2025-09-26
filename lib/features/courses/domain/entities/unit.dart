import 'package:equatable/equatable.dart';

class Unit extends Equatable {
  final String uid;
  final String type;
  final String title;
  final int durationInMinutes;
  final String locale;
  final String lastModified;

  const Unit({
    required this.uid,
    required this.type,
    required this.title,
    required this.durationInMinutes,
    required this.locale,
    required this.lastModified,
  });

  @override
  List<Object?> get props => [
        uid,
        type,
        title,
        durationInMinutes,
        locale,
        lastModified,
      ];

  Unit copyWith({
    String? uid,
    String? type,
    String? title,
    int? durationInMinutes,
    String? locale,
    String? lastModified,
  }) {
    return Unit(
      uid: uid ?? this.uid,
      type: type ?? this.type,
      title: title ?? this.title,
      durationInMinutes: durationInMinutes ?? this.durationInMinutes,
      locale: locale ?? this.locale,
      lastModified: lastModified ?? this.lastModified,
    );
  }

  @override
  String toString() {
    return 'Unit(uid: $uid, type: $type, title: $title, durationInMinutes: $durationInMinutes, locale: $locale, lastModified: $lastModified)';
  }
}
