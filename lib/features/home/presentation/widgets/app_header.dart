import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

import 'theme_switcher.dart';

class AppHeader extends StatelessWidget {
  final String userName;
  final int streakDays;

  const AppHeader({super.key, required this.userName, required this.streakDays});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('finny', style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Icon(Icons.visibility_outlined, color: context.colorScheme.onSurface.withValues(alpha: 0.7), size: 24),
                  const SizedBox(width: 16),
                  Icon(Icons.notifications_outlined, color: context.colorScheme.onSurface.withValues(alpha: 0.7), size: 24),
                  const SizedBox(width: 8),
                  const SimpleThemeToggle(),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hola, $userName', style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: context.colorScheme.surfaceContainer, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.flash_on, size: 16, color: context.colorScheme.primary),
                    const SizedBox(width: 4),
                    Text(
                      '$streakDays día de racha',
                      style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500, color: context.colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
