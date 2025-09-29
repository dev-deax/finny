import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../config/constants/environment.dart';
import '../../../../core/constants/error_messages.dart';
import '../../domain/entities/course.dart';
import '../mappers/course_mapper.dart';
import '../models/api/api_response_model.dart';
import '../models/api/course_model.dart';

abstract class CourseApiDataSource {
  Future<Course?> getCourseById(String id);

  Future<List<Course>> getCourses({
    int page = 1,
    int pageSize = 20,
    String? search,
    String? type,
    String? level,
    List<String>? products,
    List<String>? roles,
    List<String>? subjects,
  });
}

class CourseApiDataSourceImpl implements CourseApiDataSource {
  final Dio _dio;

  CourseApiDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Course?> getCourseById(String id) async {
    try {
      final response = await _dio.get('${Environment.microsoftLearnApiBaseUrl}/$id');

      if (response.statusCode == 200) {
        final courseData = response.data;
        if (courseData != null) {
          final courseApiModel = CourseModel.fromJson(courseData);
          return CourseMapper.toDomain(courseApiModel);
        }
      }
      return null;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.connectionError) {
        throw Exception(ErrorMessages.connectionError);
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('${ErrorMessages.serverError}: ${e.response?.statusCode}');
      } else {
        throw Exception('${ErrorMessages.unexpectedError}: ${e.message}');
      }
    } on SocketException {
      throw Exception(ErrorMessages.noInternetConnection);
    } catch (e) {
      throw Exception('${ErrorMessages.errorGettingCourse}: $e');
    }
  }

  @override
  Future<List<Course>> getCourses({
    int page = 1,
    int pageSize = 20,
    String? search,
    String? type,
    String? level,
    List<String>? products,
    List<String>? roles,
    List<String>? subjects,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'locale': 'es-es',
      };

      queryParams['type'] = 'courses';

      if (level != null && level.isNotEmpty) {
        queryParams['level'] = level;
      }

      if (products != null && products.isNotEmpty) {
        queryParams['product'] = products.join(',');
      }

      if (roles != null && roles.isNotEmpty) {
        queryParams['role'] = roles.join(',');
      }

      if (subjects != null && subjects.isNotEmpty) {
        queryParams['subject'] = subjects.join(',');
      }

      final response = await _dio.get(
        Environment.microsoftLearnApiBaseUrl,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final apiResponse = ApiResponseModel.fromJson(response.data);

        List<Course> courses = apiResponse.courses.map((courseModel) => CourseMapper.toDomain(courseModel)).toList();

        if (search != null && search.isNotEmpty) {
          courses = courses.where((course) {
            return course.title.toLowerCase().contains(search.toLowerCase()) || course.summary.toLowerCase().contains(search.toLowerCase());
          }).toList();
        }

        final startIndex = (page - 1) * pageSize;
        final endIndex = startIndex + pageSize;

        if (startIndex >= courses.length) {
          return [];
        }

        return courses.sublist(
          startIndex,
          endIndex > courses.length ? courses.length : endIndex,
        );
      } else {
        throw Exception('${ErrorMessages.errorGettingCourses}: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.connectionError) {
        throw Exception(ErrorMessages.connectionError);
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('${ErrorMessages.serverError}: ${e.response?.statusCode}');
      } else {
        throw Exception('${ErrorMessages.unexpectedError}: ${e.message}');
      }
    } on SocketException {
      throw Exception(ErrorMessages.noInternetConnection);
    } catch (e) {
      throw Exception('${ErrorMessages.errorGettingCourses}: $e');
    }
  }
}
