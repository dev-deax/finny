import '../entities/filter_option.dart';
import '../repositories/filter_repository.dart';

class GetFilterOptions {
  final FilterRepository _repository;

  GetFilterOptions({required FilterRepository repository}) : _repository = repository;

  Future<List<FilterOption>> getProducts() async {
    return await _repository.getProducts();
  }

  Future<List<FilterOption>> getRoles() async {
    return await _repository.getRoles();
  }

  Future<List<FilterOption>> getSubjects() async {
    return await _repository.getSubjects();
  }

  Future<List<FilterOption>> getLevels() async {
    return await _repository.getLevels();
  }

  Future<List<FilterOption>> getTypes() async {
    return await _repository.getTypes();
  }
}
