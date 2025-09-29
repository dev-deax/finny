import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isEnabled;
  final int? count;
  final VoidCallback? onTap;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;

  const ChipWidget({
    super.key,
    required this.label,
    this.isSelected = false,
    this.isEnabled = true,
    this.count,
    this.onTap,
    this.icon,
    this.padding,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.colorScheme.primary;
    final backgroundColor = _getBackgroundColor(context);
    final textColor = _getTextColor(context);
    final borderColor = _getBorderColor(context);

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: 142,
        height: 40,
        padding: const EdgeInsets.only(top: 8, right: 12, bottom: 8, left: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 12,
                color: textColor,
              ),
              const SizedBox(width: 10),
            ],
            Text(
              label,
              style: textStyle ??
                  context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
            ),
            if (count != null && count! > 0 && isEnabled) ...[
              const SizedBox(width: 10),
              _buildCountBadge(context, primaryColor),
            ],
            if (!isEnabled) ...[
              const SizedBox(width: 10),
              Icon(
                Icons.wifi_off,
                size: 12,
                color: Colors.grey.shade500,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    if (!isEnabled) return Colors.grey.shade200;

    if (isSelected) return context.colorScheme.tertiaryContainer;

    return context.colorScheme.surface;
  }

  Color _getTextColor(BuildContext context) {
    if (!isEnabled) return Colors.grey.shade500;

    return context.colorScheme.onTertiaryContainer;
  }

  Color _getBorderColor(BuildContext context) {
    if (!isEnabled) return Colors.grey.shade300;

    if (isSelected) return context.colorScheme.tertiaryFixed;

    return context.colorScheme.surface;
  }

  Widget _buildCountBadge(BuildContext context, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$count',
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colorScheme.surface,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
