import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/module.dart';
import '../course/course_providers.dart';

final filteredCoursesProvider = Provider<List<Module>>((ref) {
  final searchState = ref.watch(searchProvider);
  final courseListState = ref.watch(courseListProvider);

  List<Module> courses = courseListState.courses;

  if (searchState.query.isNotEmpty) {
    courses = courses.where((course) {
      return course.title.toLowerCase().contains(searchState.query.toLowerCase()) || course.summary.toLowerCase().contains(searchState.query.toLowerCase());
    }).toList();
  }

  if (searchState.type != null) {
    courses = courses.where((course) => course.type == searchState.type).toList();
  }

  if (searchState.level != null) {
    courses = courses.where((course) => course.levels.contains(searchState.level!)).toList();
  }

  if (searchState.products != null && searchState.products!.isNotEmpty) {
    courses = courses.where((course) {
      return course.products.any((product) => searchState.products!.contains(product));
    }).toList();
  }

  return courses;
});

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(const SearchState());

  void clearFilters() {
    state = state.copyWith(
      type: null,
      level: null,
      products: null,
    );
  }

  void clearSearch() {
    state = const SearchState();
  }

  void setSearching(bool isSearching) {
    state = state.copyWith(isSearching: isSearching);
  }

  void updateFilteredCourses(List<Module> courses) {
    state = state.copyWith(filteredCourses: courses);
  }

  void updateLevel(String? level) {
    state = state.copyWith(level: level);
  }

  void updateProducts(List<String>? products) {
    state = state.copyWith(products: products);
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  void updateType(String? type) {
    state = state.copyWith(type: type);
  }
}

class SearchState {
  final String query;
  final String? type;
  final String? level;
  final List<String>? products;
  final List<Module> filteredCourses;
  final bool isSearching;

  const SearchState({
    this.query = '',
    this.type,
    this.level,
    this.products,
    this.filteredCourses = const [],
    this.isSearching = false,
  });

  SearchState copyWith({
    String? query,
    String? type,
    String? level,
    List<String>? products,
    List<Module>? filteredCourses,
    bool? isSearching,
  }) {
    return SearchState(
      query: query ?? this.query,
      type: type ?? this.type,
      level: level ?? this.level,
      products: products ?? this.products,
      filteredCourses: filteredCourses ?? this.filteredCourses,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}
