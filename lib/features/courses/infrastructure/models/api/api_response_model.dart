import 'package:equatable/equatable.dart';

import 'course_model.dart';

class ApiResponseModel extends Equatable {
  final List<CourseModel> courses;

  const ApiResponseModel({
    required this.courses,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    final coursesList = json['courses'] as List<dynamic>? ?? [];

    return ApiResponseModel(
      courses: coursesList.map((courseJson) => CourseModel.fromJson(courseJson as Map<String, dynamic>)).toList(),
    );
  }

  @override
  List<Object?> get props => [courses];

  Map<String, dynamic> toJson() {
    return {
      'courses': courses.map((course) => course.toJson()).toList(),
    };
  }
}
