import 'dart:io';

import 'package:dio/dio.dart';

import '../constants/error_messages.dart';

mixin HttpErrorHandlerMixin {
  Exception handleHttpError(DioException e, {String? customMessage}) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.connectionError) {
      return Exception(ErrorMessages.connectionError);
    } else if (e.type == DioExceptionType.badResponse) {
      return Exception('${ErrorMessages.serverError}: ${e.response?.statusCode}');
    } else {
      return Exception(customMessage ?? '${ErrorMessages.unexpectedError}: ${e.message}');
    }
  }

  Exception handleSocketError({String? customMessage}) {
    return Exception(customMessage ?? ErrorMessages.noInternetConnection);
  }

  Exception handleGeneralError(dynamic error, {String? customMessage}) {
    if (error.toString().contains('SocketException')) {
      return handleSocketError(customMessage: customMessage);
    }
    return Exception(customMessage ?? '${ErrorMessages.unexpectedError}: $error');
  }

  Exception handleApiError(dynamic error, {String? customMessage}) {
    if (error is DioException) {
      return handleHttpError(error, customMessage: customMessage);
    } else if (error is SocketException) {
      return handleSocketError(customMessage: customMessage);
    } else {
      return handleGeneralError(error, customMessage: customMessage);
    }
  }
}
