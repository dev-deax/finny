import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final PreferredSizeWidget? bottom;

  const AppBarWidget({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 390,
        height: 68,
        padding: const EdgeInsets.only(
          top: 12,
          right: 16,
          bottom: 12,
          left: 16,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          border: Border(
            bottom: BorderSide(
              color: context.colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showBackButton)
              BackButtonWidget(
                onPressed: onBackPressed,
              )
            else
              const SizedBox(width: 24),
            Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 18,
                color: context.colorScheme.onSurface,
              ),
            ),
            if (actions != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: actions!,
              )
            else
              const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size(390, 68);
  }
}
