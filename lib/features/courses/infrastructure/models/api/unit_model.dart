import 'package:equatable/equatable.dart';

class UnitModel extends Equatable {
  final String uid;
  final String type;
  final String title;
  final int durationInMinutes;
  final String locale;
  final String lastModified;

  const UnitModel({
    required this.uid,
    required this.type,
    required this.title,
    required this.durationInMinutes,
    required this.locale,
    required this.lastModified,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return UnitModel(
      uid: json['uid'] as String? ?? '',
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      durationInMinutes: json['duration_in_minutes'] as int? ?? 0,
      locale: json['locale'] as String? ?? '',
      lastModified: json['last_modified'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [
        uid,
        type,
        title,
        durationInMinutes,
        locale,
        lastModified,
      ];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'type': type,
      'title': title,
      'duration_in_minutes': durationInMinutes,
      'locale': locale,
      'last_modified': lastModified,
    };
  }
}
