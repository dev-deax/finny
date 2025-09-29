import '../entities/filter_option.dart';
import '../repositories/filter_repository.dart';

class GetFilterOptions {
  final FilterRepository _repository;

  GetFilterOptions({required FilterRepository repository}) : _repository = repository;

  Future<List<FilterOption>> getProducts() async => await _repository.getProducts();

  Future<List<FilterOption>> getRoles() async => await _repository.getRoles();

  Future<List<FilterOption>> getSubjects() async => await _repository.getSubjects();

  Future<List<FilterOption>> getLevels() async => await _repository.getLevels();

  Future<List<FilterOption>> getTypes() async => await _repository.getTypes();
}
