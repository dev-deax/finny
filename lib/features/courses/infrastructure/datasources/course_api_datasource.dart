import 'package:dio/dio.dart';

import '../../../../config/constants/environment.dart';
import '../../domain/entities/course.dart';
import '../mappers/course_mapper.dart';
import '../models/api/api_response_model.dart';
import '../models/api/course_api_model.dart';

abstract class CourseApiDataSource {
  Future<Course?> getCourseById(String id);

  Future<List<Course>> getCourses({
    int page = 1,
    int pageSize = 20,
    String? search,
    String? type,
    String? level,
    List<String>? products,
  });
}

class CourseApiDataSourceImpl implements CourseApiDataSource {
  final Dio _dio;

  CourseApiDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Course?> getCourseById(String id) async {
    try {
      final response = await _dio.get(
        '${Environment.microsoftLearnApiBaseUrl}/$id',
      );

      if (response.statusCode == 200) {
        final courseData = response.data;
        if (courseData != null) {
          final courseApiModel = CourseApiModel.fromJson(courseData);
          return CourseMapper.toDomain(courseApiModel);
        }
      }
      return null;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Error de conexión. Verifica tu conexión a internet.');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('Error del servidor: ${e.response?.statusCode}');
      } else {
        throw Exception('Error inesperado: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error al obtener curso: $e');
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
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
      };

      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }

      if (type != null && type.isNotEmpty) {
        queryParams['type'] = type;
      }

      if (level != null && level.isNotEmpty) {
        queryParams['level'] = level;
      }

      if (products != null && products.isNotEmpty) {
        queryParams['products'] = products.join(',');
      }

      final response = await _dio.get(
        Environment.microsoftLearnApiBaseUrl,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final apiResponse = ApiResponseModel.fromJson(response.data);
        return CourseMapper.toDomainList(apiResponse.courses);
      } else {
        throw Exception('Error al obtener cursos: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Error de conexión. Verifica tu conexión a internet.');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('Error del servidor: ${e.response?.statusCode}');
      } else {
        throw Exception('Error inesperado: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error al obtener cursos: $e');
    }
  }
}
