import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../config/constants/environment.dart';
import '../../domain/entities/filter_option.dart';

abstract class FilterApiDataSource {
  Future<List<FilterOption>> getProducts();
  Future<List<FilterOption>> getRoles();
  Future<List<FilterOption>> getSubjects();
  Future<List<FilterOption>> getLevels();
  Future<List<FilterOption>> getTypes();
}

class FilterApiDataSourceImpl implements FilterApiDataSource {
  final Dio _dio;

  FilterApiDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<FilterOption>> getProducts() async {
    try {
      final response = await _dio.get('${Environment.microsoftLearnApiBaseUrl}/?type=products');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['products'] is List) {
          final productsList = data['products'] as List;
          return productsList.map((product) {
            return FilterOption(
              id: product['id']?.toString() ?? '',
              name: product['name']?.toString() ?? '',
            );
          }).toList();
        }
      }

      // Retornar lista vacía si la API falla
      return [];
    } on DioException catch (e) {
      debugPrint('Error al obtener productos: $e');
      return [];
    } catch (e) {
      debugPrint('Error inesperado al obtener productos: $e');
      return [];
    }
  }

  @override
  Future<List<FilterOption>> getRoles() async {
    try {
      final response = await _dio.get('${Environment.microsoftLearnApiBaseUrl}/?type=roles');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['roles'] is List) {
          final rolesList = data['roles'] as List;
          return rolesList.map((role) {
            return FilterOption(
              id: role['id']?.toString() ?? '',
              name: role['name']?.toString() ?? '',
            );
          }).toList();
        }
      }

      // Retornar lista vacía si la API falla
      return [];
    } on DioException catch (e) {
      debugPrint('Error al obtener roles: $e');
      return [];
    } catch (e) {
      debugPrint('Error inesperado al obtener roles: $e');
      return [];
    }
  }

  @override
  Future<List<FilterOption>> getSubjects() async {
    try {
      final response = await _dio.get('${Environment.microsoftLearnApiBaseUrl}/?type=subjects');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['subjects'] is List) {
          final subjectsList = data['subjects'] as List;
          return subjectsList.map((subject) {
            return FilterOption(
              id: subject['id']?.toString() ?? '',
              name: subject['name']?.toString() ?? '',
            );
          }).toList();
        }
      }

      // Retornar lista vacía si la API falla
      return [];
    } on DioException catch (e) {
      debugPrint('Error al obtener subjects: $e');
      return [];
    } catch (e) {
      debugPrint('Error inesperado al obtener subjects: $e');
      return [];
    }
  }

  @override
  Future<List<FilterOption>> getLevels() async {
    try {
      final response = await _dio.get('${Environment.microsoftLearnApiBaseUrl}/?type=levels');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['levels'] is List) {
          final levelsList = data['levels'] as List;
          return levelsList.map((level) {
            return FilterOption(
              id: level['id']?.toString() ?? '',
              name: level['name']?.toString() ?? '',
            );
          }).toList();
        }
      }

      // Retornar lista vacía si la API falla
      return [];
    } on DioException catch (e) {
      debugPrint('Error al obtener niveles: $e');
      return [];
    } catch (e) {
      debugPrint('Error inesperado al obtener niveles: $e');
      return [];
    }
  }

  @override
  Future<List<FilterOption>> getTypes() async {
    try {
      final response = await _dio.get('${Environment.microsoftLearnApiBaseUrl}/?type=types');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['types'] is List) {
          final typesList = data['types'] as List;
          return typesList.map((type) {
            return FilterOption(
              id: type['id']?.toString() ?? '',
              name: type['name']?.toString() ?? '',
            );
          }).toList();
        }
      }

      // Retornar lista vacía si la API falla
      return [];
    } on DioException catch (e) {
      debugPrint('Error al obtener tipos: $e');
      return [];
    } catch (e) {
      debugPrint('Error inesperado al obtener tipos: $e');
      return [];
    }
  }
}
