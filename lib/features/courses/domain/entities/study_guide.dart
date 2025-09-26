import 'package:equatable/equatable.dart';

class StudyGuide extends Equatable {
  final String uid;
  final String type;

  const StudyGuide({
    required this.uid,
    required this.type,
  });

  @override
  List<Object?> get props => [uid, type];

  StudyGuide copyWith({
    String? uid,
    String? type,
  }) {
    return StudyGuide(
      uid: uid ?? this.uid,
      type: type ?? this.type,
    );
  }

  @override
  String toString() {
    return 'StudyGuide(uid: $uid, type: $type)';
  }
}
