import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'theme_switcher.dart';

class AppHeader extends StatelessWidget {
  final String userName;
  final int streakDays;

  const AppHeader({super.key, required this.userName, required this.streakDays});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAppBar(context),
        Container(
          margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
          height: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildUserName(context),
              _buildStreakDays(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserName(BuildContext context) => Text('Hola, $userName', style: context.textTheme.titleMedium);

  Widget _buildStreakDays(BuildContext context) => Container(
        height: 24,
        padding: const EdgeInsets.only(top: 2, right: 8, bottom: 2, left: 4),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.flash_on, size: 20, color: context.colorScheme.primary),
            const SizedBox(width: 2),
            Text('$streakDays día de racha', style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.primary)),
          ],
        ),
      );

  Widget _buildAppBar(BuildContext context) => Container(
        width: 390,
        height: 64,
        padding: const EdgeInsets.only(
          top: 12,
          right: 16,
          bottom: 12,
          left: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AdaptiveLogo(
              width: 79.11418151855469,
              height: 24.000259399414062,
            ),
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
      );
}
