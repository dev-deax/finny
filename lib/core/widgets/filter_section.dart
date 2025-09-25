import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

import 'filter_button.dart';

class FilterSection extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;

  const FilterSection({super.key, required this.selectedFilter, required this.onFilterChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Cursos', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(width: 8),
            Icon(Icons.info_outline, size: 16, color: context.colorScheme.onSurfaceVariant),    
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FilterButton(text: 'Todos los cursos', isSelected: selectedFilter == 'all', onTap: () => onFilterChanged('all')),
              const SizedBox(width: 12),
              FilterButton(text: 'Inversiones', icon: '💰', isSelected: selectedFilter == 'investments', onTap: () => onFilterChanged('investments')),
              const SizedBox(width: 12),
              FilterButton(text: 'Finanzas Personales', icon: '\$', isSelected: selectedFilter == 'personal_finance', onTap: () => onFilterChanged('personal_finance')),
            ],
          ),
        ),
      ],
    );
  }
}
