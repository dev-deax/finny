import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filter_provider.dart';
import 'filter_dropdown.dart';

class FilterBar extends ConsumerStatefulWidget {
  const FilterBar({super.key});

  @override
  ConsumerState<FilterBar> createState() => _MobileFilterBarState();
}

class _MobileFilterBarState extends ConsumerState<FilterBar> {
  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(filterStateProvider);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Row(
            children: [
              // Chip de "Todos los cursos" - siempre visible
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
                      ),
                      const SizedBox(width: 8),
                      _buildQuickFilterChip(
                        'Roles',
                        filterState.selectedRoles.length,
                        () => _showFilterOptions(context, 'roles'),
                        filterState.selectedRoles.isNotEmpty,
                      ),
                      const SizedBox(width: 8),
                      _buildQuickFilterChip(
                        'Niveles',
                        filterState.selectedLevels.length,
                        () => _showFilterOptions(context, 'levels'),
                        filterState.selectedLevels.isNotEmpty,
                      ),
                      const SizedBox(width: 8),
                      _buildQuickFilterChip(
                        'Temas',
                        filterState.selectedSubjects.length,
                        () => _showFilterOptions(context, 'subjects'),
                        filterState.selectedSubjects.isNotEmpty,
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: !hasActiveFilters ? Theme.of(context).primaryColor : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: !hasActiveFilters ? Theme.of(context).primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Text(
          'Todos los cursos',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: !hasActiveFilters ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickFilterChip(
    String label,
    int count,
    VoidCallback onTap,
    bool isActive,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor.withValues(alpha: 0.1) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive ? Theme.of(context).primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? Theme.of(context).primaryColor : Colors.grey.shade700,
              ),
            ),
            if (count > 0) ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$count',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
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
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
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
