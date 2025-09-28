import '../../domain/entities/filter_option.dart';
import '../../domain/repositories/filter_repository.dart';
import '../datasources/filter_api_datasource.dart';

class FilterRepositoryImpl implements FilterRepository {
  final FilterApiDataSource _dataSource;

  FilterRepositoryImpl({required FilterApiDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<List<FilterOption>> getProducts() async {
    return await _dataSource.getProducts();
  }

  @override
  Future<List<FilterOption>> getRoles() async {
    return await _dataSource.getRoles();
  }

  @override
  Future<List<FilterOption>> getSubjects() async {
    return await _dataSource.getSubjects();
  }

  @override
  Future<List<FilterOption>> getLevels() async {
    return await _dataSource.getLevels();
  }

  @override
  Future<List<FilterOption>> getTypes() async {
    return await _dataSource.getTypes();
  }
}
