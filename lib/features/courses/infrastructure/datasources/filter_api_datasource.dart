import '../../../../config/constants/environment.dart';
import '../../../../core/constants/error_messages.dart';
import '../../../../core/datasources/base_api_datasource.dart';
import '../../domain/entities/filter_option.dart';

abstract class FilterApiDataSource {
  Future<List<FilterOption>> getProducts();
  Future<List<FilterOption>> getRoles();
  Future<List<FilterOption>> getSubjects();
  Future<List<FilterOption>> getLevels();
  Future<List<FilterOption>> getTypes();
}

class FilterApiDataSourceImpl extends BaseApiDataSource implements FilterApiDataSource {
  FilterApiDataSourceImpl({required super.dio});

  @override
  Future<List<FilterOption>> getProducts() async {
    return getFilterList<FilterOption>(
      '${Environment.microsoftLearnApiBaseUrl}/?type=products',
      'products',
      (json) => FilterOption(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
      ),
      customErrorMessage: ErrorMessages.errorGettingProducts,
    );
  }

  @override
  Future<List<FilterOption>> getRoles() async {
    return getFilterList<FilterOption>(
      '${Environment.microsoftLearnApiBaseUrl}/?type=roles',
      'roles',
      (json) => FilterOption(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
      ),
      customErrorMessage: ErrorMessages.errorGettingRoles,
    );
  }

  @override
  Future<List<FilterOption>> getSubjects() async {
    return getFilterList<FilterOption>(
      '${Environment.microsoftLearnApiBaseUrl}/?type=subjects',
      'subjects',
      (json) => FilterOption(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
      ),
      customErrorMessage: ErrorMessages.errorGettingSubjects,
    );
  }

  @override
  Future<List<FilterOption>> getLevels() async {
    return getFilterList<FilterOption>(
      '${Environment.microsoftLearnApiBaseUrl}/?type=levels',
      'levels',
      (json) => FilterOption(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
      ),
      customErrorMessage: ErrorMessages.errorGettingLevels,
    );
  }

  @override
  Future<List<FilterOption>> getTypes() async {
    return getFilterList<FilterOption>(
      '${Environment.microsoftLearnApiBaseUrl}/?type=types',
      'types',
      (json) => FilterOption(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
      ),
      customErrorMessage: ErrorMessages.errorGettingTypes,
    );
  }
}
