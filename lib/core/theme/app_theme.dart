import 'package:flutter/material.dart';

import '../constants/app_design.dart';
import 'theme_builders.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return _buildTheme(brightness: Brightness.dark, cardElevation: AppDesign.cardElevation, shadowAlpha: 0.3);
  }

  static ThemeData get lightTheme {
    return _buildTheme(brightness: Brightness.light, cardElevation: AppDesign.lightCardElevation, shadowAlpha: 0.1);
  }

  static ThemeData _buildTheme({required Brightness brightness, required double cardElevation, required double shadowAlpha}) {
    return ThemeData(
      
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ThemeBuilders.buildColorScheme(brightness: brightness),
      appBarTheme: ThemeBuilders.buildAppBarTheme(),
      cardTheme: ThemeBuilders.buildCardTheme(elevation: cardElevation, shadowAlpha: shadowAlpha),
      textTheme: ThemeBuilders.buildTextTheme(),
      elevatedButtonTheme: ThemeBuilders.buildElevatedButtonTheme(),
      outlinedButtonTheme: ThemeBuilders.buildOutlinedButtonTheme(),
    );
  }
}
