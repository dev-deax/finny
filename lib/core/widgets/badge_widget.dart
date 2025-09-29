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

  const BadgeWidget({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPadding = padding ?? const EdgeInsets.only(left: 8, right: 8);
    final defaultBorderRadius = borderRadius ?? BorderRadius.circular(100);
    final defaultBackgroundColor = backgroundColor ?? context.colorScheme.surface;
    final defaultTextColor = textColor ?? context.colorScheme.onSecondaryFixedVariant;
    final defaultTextStyle = textStyle ??
        context.textTheme.labelSmall?.copyWith(
          fontSize: 12,
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

    return Container(
      height: 24,
      padding: defaultPadding,
      decoration: BoxDecoration(
        color: defaultBackgroundColor,
        borderRadius: defaultBorderRadius,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 0.5,
        ),
      ),
      child: content,
    );
  }
}
