import 'package:flutter/material.dart';

import '../extension/build_context_extension.dart';

class ProgressCard extends StatelessWidget {
  final int number;
  final String label;

  const ProgressCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: context.colorScheme.outline.withValues(alpha: 0.5), width: 1),
          boxShadow: [BoxShadow(color: context.colorScheme.shadow.withValues(alpha: 0.1), blurRadius: 2, offset: const Offset(0, 1), spreadRadius: 0)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              number.toString(),
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colorScheme.onTertiaryContainer),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500, color: context.colorScheme.onTertiaryContainer),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
