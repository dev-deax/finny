import '../entities/filter_option.dart';

abstract class FilterRepository {
  Future<List<FilterOption>> getProducts();
  Future<List<FilterOption>> getRoles();
  Future<List<FilterOption>> getSubjects();
  Future<List<FilterOption>> getLevels();
  Future<List<FilterOption>> getTypes();
}
