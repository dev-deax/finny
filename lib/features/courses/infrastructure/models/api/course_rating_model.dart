import 'package:equatable/equatable.dart';

class CourseRatingModel extends Equatable {
  final int count;
  final double average;

  const CourseRatingModel({
    required this.count,
    required this.average,
  });

  factory CourseRatingModel.fromJson(Map<String, dynamic> json) {
    return CourseRatingModel(
      count: json['count'] as int? ?? 0,
      average: (json['average'] as num?)?.toDouble() ?? 0.0,
    );
  }

  @override
  List<Object?> get props => [count, average];

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'average': average,
    };
  }
}
