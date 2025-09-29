import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class ImageErrorWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final String? message;

  const ImageErrorWidget({
    super.key,
    this.width,
    this.height,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor ?? context.colorScheme.outline.withValues(alpha: 0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon ?? Icons.error,
            color: iconColor ?? context.colorScheme.outline,
            size: (width != null && height != null) ? (width! < height! ? width! * 0.3 : height! * 0.3) : 24,
          ),
          if (message != null && width != null && height != null && width! > 60 && height! > 60) ...[
            const SizedBox(height: 4),
            Text(
              message!,
              style: context.textTheme.bodySmall?.copyWith(
                color: iconColor ?? context.colorScheme.outline,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
