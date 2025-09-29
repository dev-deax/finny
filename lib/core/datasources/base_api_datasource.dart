import 'package:dio/dio.dart';

import '../mixins/http_error_handler_mixin.dart';

abstract class BaseApiDataSource with HttpErrorHandlerMixin {
  final Dio dio;

  BaseApiDataSource({required this.dio});

  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
    String? customErrorMessage,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        throw Exception('Error del servidor: ${response.statusCode}');
      }
    } catch (e) {
      throw handleApiError(e, customMessage: customErrorMessage);
    }
  }

  Future<List<T>> getFilterList<T>(
    String endpoint,
    String listKey,
    T Function(Map<String, dynamic>) fromJson, {
    String? customErrorMessage,
  }) async {
    try {
      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data[listKey] is List) {
          final list = data[listKey] as List;
          return list.map((item) => fromJson(item)).toList();
        }
      }

      return [];
    } catch (e) {
      throw handleApiError(e, customMessage: customErrorMessage);
    }
  }
}
