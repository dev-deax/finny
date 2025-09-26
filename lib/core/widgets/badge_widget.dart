import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const BadgeWidget({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPadding = padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
    final defaultBorderRadius = borderRadius ?? BorderRadius.circular(12);
    final defaultBackgroundColor = backgroundColor ?? context.colorScheme.surfaceContainerHighest;
    final defaultTextColor = textColor ?? context.colorScheme.primary;
    final defaultTextStyle = textStyle ??
        context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: defaultTextColor,
        );

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          icon!,
          const SizedBox(width: 4),
        ],
        Text(
          text,
          style: defaultTextStyle,
        ),
      ],
    );

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: defaultBorderRadius,
        child: content,
      );
    }

    return Container(
      padding: defaultPadding,
      decoration: BoxDecoration(
        color: defaultBackgroundColor,
        borderRadius: defaultBorderRadius,
      ),
      child: content,
    );
  }
}
