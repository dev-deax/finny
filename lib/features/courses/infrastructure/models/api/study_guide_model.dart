import 'package:equatable/equatable.dart';

class StudyGuideModel extends Equatable {
  final String uid;
  final String type;

  const StudyGuideModel({
    required this.uid,
    required this.type,
  });

  factory StudyGuideModel.fromJson(Map<String, dynamic> json) {
    return StudyGuideModel(
      uid: json['uid'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [uid, type];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'type': type,
    };
  }
}
