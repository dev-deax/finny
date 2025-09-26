import 'dart:developer';

import 'package:equatable/equatable.dart';

import 'course_api_model.dart';

class ApiResponseModel extends Equatable {
  final List<CourseApiModel> courses;
  final int? totalCount;
  final int? page;
  final int? pageSize;
  final bool hasMore;

  const ApiResponseModel({
    required this.courses,
    this.totalCount,
    this.page,
    this.pageSize,
    this.hasMore = false,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    log('ApiResponseModel fromJson: $json');
    final coursesList = json['modules'] as List<dynamic>? ?? [];

    return ApiResponseModel(
      courses: coursesList.map((courseJson) => CourseApiModel.fromJson(courseJson as Map<String, dynamic>)).toList(),
      totalCount: json['total_count'] != null ? (json['total_count'] as num).toInt() : null,
      page: json['page'] != null ? (json['page'] as num).toInt() : null,
      pageSize: json['page_size'] != null ? (json['page_size'] as num).toInt() : null,
      hasMore: json['has_more'] as bool? ?? false,
    );
  }

  @override
  List<Object?> get props => [courses, totalCount, page, pageSize, hasMore];

  Map<String, dynamic> toJson() {
    return {
      'modules': courses.map((course) => course.toJson()).toList(),
      'total_count': totalCount,
      'page': page,
      'page_size': pageSize,
      'has_more': hasMore,
    };
  }
}
