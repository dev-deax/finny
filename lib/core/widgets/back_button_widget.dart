import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? iconColor;
  final IconData? icon;

  const BackButtonWidget({
    super.key,
    this.onPressed,
    this.iconColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon ?? Icons.adaptive.arrow_back,
        color: iconColor ?? context.colorScheme.onSurface,
      ),
      onPressed: onPressed ?? () => context.pop(),
    );
  }
}
