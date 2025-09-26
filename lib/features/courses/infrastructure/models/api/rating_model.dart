import 'package:equatable/equatable.dart';

class RatingModel extends Equatable {
  final int count;
  final double average;

  const RatingModel({
    required this.count,
    required this.average,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
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
