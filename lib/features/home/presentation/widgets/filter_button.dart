import 'package:flutter/material.dart';

import '../../../../core/extension/build_context_extension.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final String? icon;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({super.key, required this.text, this.icon, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? context.colorScheme.surfaceContainerHighest : context.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? context.colorScheme.primary : context.colorScheme.outline.withValues(alpha: 0.3), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[Text(icon!, style: context.textTheme.bodySmall), const SizedBox(width: 6)],
            Text(
              text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: isSelected ? context.colorScheme.primary : context.colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
