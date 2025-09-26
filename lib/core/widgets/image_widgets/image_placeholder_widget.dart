import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class ImagePlaceholderWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final BoxFit? fit;

  const ImagePlaceholderWidget({
    super.key,
    this.width,
    this.height,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor ?? context.colorScheme.outline.withValues(alpha: 0.3),
      child: Icon(
        icon ?? Icons.image,
        color: iconColor ?? context.colorScheme.outline,
        size: (width != null && height != null) ? (width! < height! ? width! * 0.4 : height! * 0.4) : 24,
      ),
    );
  }
}
