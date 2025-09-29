import 'package:finny/core/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/connectivity_providers.dart';
import '../../../../core/widgets/chip_widget.dart';
import '../../domain/entities/filter_option.dart';
import '../providers/filter_provider.dart';
import 'filter_dropdown.dart';

class FilterBar extends ConsumerStatefulWidget {
  const FilterBar({super.key});

  @override
  ConsumerState<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends ConsumerState<FilterBar> {
  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(filterStateProvider);
    final connectivityState = ref.watch(connectivityStateProvider);

    return connectivityState.when(
      data: (isConnected) => _buildFilterBar(context, filterState, isConnected),
      loading: () => _buildFilterBar(context, filterState, true),
      error: (_, __) => _buildFilterBar(context, filterState, false),
    );
  }

  Widget _buildFilterBar(BuildContext context, FilterState filterState, bool isConnected) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Row(
            children: [
              _buildAllCoursesChip(
                filterState.hasActiveFilters,
                () => ref.read(filterStateProvider.notifier).clearAllFilters(),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildQuickFilterChip(
                        'Productos',
                        filterState.selectedProducts.length,
                        () => _showFilterOptions(context, 'products'),
                        filterState.selectedProducts.isNotEmpty,
                        isEnabled: isConnected,
                      ),
                      const SizedBox(width: 8),
                      _buildQuickFilterChip(
                        'Roles',
                        filterState.selectedRoles.length,
                        () => _showFilterOptions(context, 'roles'),
                        filterState.selectedRoles.isNotEmpty,
                        isEnabled: isConnected,
                      ),
                      const SizedBox(width: 8),
                      _buildQuickFilterChip(
                        'Niveles',
                        filterState.selectedLevels.length,
                        () => _showFilterOptions(context, 'levels'),
                        filterState.selectedLevels.isNotEmpty,
                        isEnabled: isConnected,
                      ),
                      const SizedBox(width: 8),
                      _buildQuickFilterChip(
                        'Temas',
                        filterState.selectedSubjects.length,
                        () => _showFilterOptions(context, 'subjects'),
                        filterState.selectedSubjects.isNotEmpty,
                        isEnabled: isConnected,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAllCoursesChip(
    bool hasActiveFilters,
    VoidCallback onTap,
  ) {
    return ChipWidget(
      label: 'Todos los cursos',
      isSelected: !hasActiveFilters,
      onTap: onTap,
    );
  }

  Widget _buildQuickFilterChip(
    String label,
    int count,
    VoidCallback onTap,
    bool isActive, {
    bool isEnabled = true,
  }) {
    return ChipWidget(
      label: label,
      isSelected: isActive,
      isEnabled: isEnabled,
      count: count > 0 ? count : null,
      onTap: onTap,
    );
  }

  void _showFilterOptions(BuildContext context, String filterType) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    _getFilterIcon(filterType),
                    size: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _getFilterTitle(filterType),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  BackButtonWidget(
                    icon: Icons.close,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            FilterDropdown(
              title: _getFilterTitle(filterType),
              filterType: filterType,
              searchHint: 'Buscar ${_getFilterTitle(filterType).toLowerCase()}',
              icon: _getFilterIcon(filterType),
            ),
          ],
        ),
      ),
    );
  }

  String _getFilterTitle(String filterType) {
    switch (filterType) {
      case 'products':
        return 'Productos';
      case 'roles':
        return 'Roles';
      case 'levels':
        return 'Niveles';
      case 'subjects':
        return 'Temas';
      default:
        return 'Filtro';
    }
  }

  IconData _getFilterIcon(String filterType) {
    switch (filterType) {
      case 'products':
        return Icons.category;
      case 'roles':
        return Icons.person;
      case 'levels':
        return Icons.trending_up;
      case 'subjects':
        return Icons.topic;
      default:
        return Icons.filter_list;
    }
  }
}
