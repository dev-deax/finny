import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/mixins/toggle_mixin.dart';
import '../../../../core/providers/connectivity_providers.dart';
import '../../domain/entities/filter_option.dart';
import '../../domain/repositories/filter_repository.dart';
import '../../domain/usecases/get_filter_options.dart';
import '../../infrastructure/datasources/filter_api_datasource.dart';
import '../../infrastructure/repositories/filter_repository_impl.dart';
import 'course/course_repository_provider.dart';

final filterOptionsProvider = FutureProvider.family<List<FilterOption>, String>((ref, filterType) async {
  ref.watch(connectivityStateProvider);

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

final filterApiDataSourceProvider = Provider<FilterApiDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return FilterApiDataSourceImpl(dio: dio);
});

final filterRepositoryProvider = Provider<FilterRepository>((ref) {
  final dataSource = ref.read(filterApiDataSourceProvider);
  return FilterRepositoryImpl(dataSource: dataSource);
});

final getFilterOptionsUseCaseProvider = Provider<GetFilterOptions>((ref) {
  final repository = ref.read(filterRepositoryProvider);
  return GetFilterOptions(repository: repository);
});

class FilterStateNotifier extends StateNotifier<FilterState> with ToggleMixin<FilterOption> {
  FilterStateNotifier() : super(const FilterState());

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void toggleProduct(FilterOption product) {
    final newProducts = toggleItem(state.selectedProducts, product, (a, b) => a.id == b.id);
    state = state.copyWith(selectedProducts: newProducts);
  }

  void toggleRole(FilterOption role) {
    final newRoles = toggleItem(state.selectedRoles, role, (a, b) => a.id == b.id);
    state = state.copyWith(selectedRoles: newRoles);
  }

  void toggleLevel(FilterOption level) {
    final newLevels = toggleItem(state.selectedLevels, level, (a, b) => a.id == b.id);
    state = state.copyWith(selectedLevels: newLevels);
  }

  void toggleSubject(FilterOption subject) {
    final newSubjects = toggleItem(state.selectedSubjects, subject, (a, b) => a.id == b.id);
    state = state.copyWith(selectedSubjects: newSubjects);
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
