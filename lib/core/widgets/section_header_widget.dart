import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? iconColor;
  final double iconSize;
  final IconData icon;
  final double spacing;

  const SectionHeaderWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.iconColor,
    this.iconSize = 20,
    this.icon = Icons.info_outline,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        children: [
          Text(
            text,
            style: textStyle ??
                context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
          ),
          SizedBox(width: spacing),
          Icon(
            icon,
            size: iconSize,
            color: iconColor ?? context.colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
