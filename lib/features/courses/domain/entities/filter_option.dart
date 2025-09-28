import 'package:equatable/equatable.dart';

class FilterOption extends Equatable {
  final String id;
  final String name;
  final List<FilterOption> children;
  final bool isSelected;

  const FilterOption({
    required this.id,
    required this.name,
    this.children = const [],
    this.isSelected = false,
  });

  FilterOption copyWith({
    String? id,
    String? name,
    List<FilterOption>? children,
    bool? isSelected,
  }) {
    return FilterOption(
      id: id ?? this.id,
      name: name ?? this.name,
      children: children ?? this.children,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [id, name, children, isSelected];
}

class FilterState extends Equatable {
  final List<FilterOption> selectedProducts;
  final List<FilterOption> selectedRoles;
  final List<FilterOption> selectedLevels;
  final List<FilterOption> selectedSubjects;
  final String searchQuery;

  const FilterState({
    this.selectedProducts = const [],
    this.selectedRoles = const [],
    this.selectedLevels = const [],
    this.selectedSubjects = const [],
    this.searchQuery = '',
  });

  FilterState copyWith({
    List<FilterOption>? selectedProducts,
    List<FilterOption>? selectedRoles,
    List<FilterOption>? selectedLevels,
    List<FilterOption>? selectedSubjects,
    String? searchQuery,
  }) {
    return FilterState(
      selectedProducts: selectedProducts ?? this.selectedProducts,
      selectedRoles: selectedRoles ?? this.selectedRoles,
      selectedLevels: selectedLevels ?? this.selectedLevels,
      selectedSubjects: selectedSubjects ?? this.selectedSubjects,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  bool get hasActiveFilters {
    return selectedProducts.isNotEmpty || selectedRoles.isNotEmpty || selectedLevels.isNotEmpty || selectedSubjects.isNotEmpty || searchQuery.isNotEmpty;
  }

  Map<String, dynamic> toApiParams() {
    return {
      'search': searchQuery.isNotEmpty ? searchQuery : null,
      'level': selectedLevels.isNotEmpty ? selectedLevels.map((e) => e.id).join(',') : null,
      'role': selectedRoles.isNotEmpty ? selectedRoles.map((e) => e.id).join(',') : null,
      'product': selectedProducts.isNotEmpty ? selectedProducts.map((e) => e.id).join(',') : null,
      'subject': selectedSubjects.isNotEmpty ? selectedSubjects.map((e) => e.id).join(',') : null,
    };
  }

  @override
  List<Object?> get props => [
        selectedProducts,
        selectedRoles,
        selectedLevels,
        selectedSubjects,
        searchQuery,
      ];
}
