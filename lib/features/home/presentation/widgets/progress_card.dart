import 'package:flutter/material.dart';

import '../../../../core/extension/build_context_extension.dart';

class ProgressCard extends StatelessWidget {
  final int number;
  final String label;

  const ProgressCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83.5,
      height: 83.5,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colorScheme.tertiaryFixed.withValues(alpha: 0.5), width: 1),
        boxShadow: [BoxShadow(color: const Color(0x0D101828), blurRadius: 2, offset: const Offset(0, 1), spreadRadius: 0)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            number.toString(),
            style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.onTertiaryContainer),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: context.textTheme.titleLarge?.copyWith(fontSize: 12, color: context.colorScheme.onTertiaryContainer),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
