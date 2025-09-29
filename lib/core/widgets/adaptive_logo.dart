import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Widget que muestra automáticamente el logo correcto según el tema actual
class AdaptiveLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AdaptiveLogo({
    super.key,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDarkMode = brightness == Brightness.dark;

    final logoPath = isDarkMode ? 'assets/images/logo-dark.svg' : 'assets/images/logo.svg';

    return SvgPicture.asset(
      logoPath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
