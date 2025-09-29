import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repositories/course_repository.dart';
import '../../../infrastructure/datasources/course_api_datasource.dart';
import '../../../infrastructure/datasources/local_datasource.dart';
import '../../../infrastructure/repositories/course_repository_impl.dart';

// Provider para CourseApiDataSource
final courseApiDataSourceProvider = Provider<CourseApiDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return CourseApiDataSourceImpl(dio: dio);
});

// Provider para CourseRepository
final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  final apiDataSource = ref.watch(courseApiDataSourceProvider);
  final localDataSource = ref.watch(localStorageDataSourceProvider);

  return CourseRepositoryImpl(
    apiDataSource: apiDataSource,
    localDataSource: localDataSource,
  );
});

// Provider para Dio
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

// Provider para LocalStorageDataSource
final localStorageDataSourceProvider = Provider<LocalStorageDataSource>((ref) {
  return LocalStorageDataSourceImpl();
});
