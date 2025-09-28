import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/filter_option.dart';
import '../../domain/repositories/filter_repository.dart';
import '../../domain/usecases/get_filter_options.dart';
import '../../infrastructure/datasources/filter_api_datasource.dart';
import '../../infrastructure/repositories/filter_repository_impl.dart';
import 'course/course_repository_provider.dart';

final filterOptionsProvider = FutureProvider.family<List<FilterOption>, String>((ref, filterType) async {
  final getFilterOptions = ref.read(getFilterOptionsUseCaseProvider);

  switch (filterType) {
    case 'products':
      return await getFilterOptions.getProducts();
    case 'roles':
      return await getFilterOptions.getRoles();
    case 'subjects':
      return await getFilterOptions.getSubjects();
    case 'levels':
      return await getFilterOptions.getLevels();
    default:
      return [];
  }
});

final filterStateProvider = StateNotifierProvider<FilterStateNotifier, FilterState>((ref) => FilterStateNotifier());

// Provider para el datasource de la API
final filterApiDataSourceProvider = Provider<FilterApiDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return FilterApiDataSourceImpl(dio: dio);
});

// Provider para el repositorio
final filterRepositoryProvider = Provider<FilterRepository>((ref) {
  final dataSource = ref.read(filterApiDataSourceProvider);
  return FilterRepositoryImpl(dataSource: dataSource);
});

// Provider para el caso de uso
final getFilterOptionsUseCaseProvider = Provider<GetFilterOptions>((ref) {
  final repository = ref.read(filterRepositoryProvider);
  return GetFilterOptions(repository: repository);
});

class FilterStateNotifier extends StateNotifier<FilterState> {
  FilterStateNotifier() : super(const FilterState());

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void toggleProduct(FilterOption product) {
    final currentProducts = List<FilterOption>.from(state.selectedProducts);

    if (currentProducts.any((p) => p.id == product.id)) {
      currentProducts.removeWhere((p) => p.id == product.id);
    } else {
      currentProducts.add(product);
    }

    state = state.copyWith(selectedProducts: currentProducts);
  }

  void toggleRole(FilterOption role) {
    final currentRoles = List<FilterOption>.from(state.selectedRoles);

    if (currentRoles.any((r) => r.id == role.id)) {
      currentRoles.removeWhere((r) => r.id == role.id);
    } else {
      currentRoles.add(role);
    }

    state = state.copyWith(selectedRoles: currentRoles);
  }

  void toggleLevel(FilterOption level) {
    final currentLevels = List<FilterOption>.from(state.selectedLevels);

    if (currentLevels.any((l) => l.id == level.id)) {
      currentLevels.removeWhere((l) => l.id == level.id);
    } else {
      currentLevels.add(level);
    }

    state = state.copyWith(selectedLevels: currentLevels);
  }

  void toggleSubject(FilterOption subject) {
    final currentSubjects = List<FilterOption>.from(state.selectedSubjects);

    if (currentSubjects.any((s) => s.id == subject.id)) {
      currentSubjects.removeWhere((s) => s.id == subject.id);
    } else {
      currentSubjects.add(subject);
    }

    state = state.copyWith(selectedSubjects: currentSubjects);
  }

  void clearAllFilters() {
    state = const FilterState();
  }

  void clearFilterType(String filterType) {
    switch (filterType) {
      case 'products':
        state = state.copyWith(selectedProducts: []);
        break;
      case 'roles':
        state = state.copyWith(selectedRoles: []);
        break;
      case 'levels':
        state = state.copyWith(selectedLevels: []);
        break;
      case 'subjects':
        state = state.copyWith(selectedSubjects: []);
        break;
    }
  }
}
