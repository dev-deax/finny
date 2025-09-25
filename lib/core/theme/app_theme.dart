import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_design.dart'; 
import 'theme_builders.dart';
 
class AppTheme { 
  static ThemeData get darkTheme {
    return _buildTheme(
      brightness: Brightness.dark,
      backgroundColor: AppColors.darkBackground,
      surfaceColor: AppColors.darkSurface,
      onSurfaceColor: AppColors.darkOnSurface,
      onBackgroundColor: AppColors.darkOnBackground,
      secondaryColor: AppColors.darkSecondary,
      tertiaryColor: AppColors.darkTertiary,
      cardElevation: AppDesign.cardElevation,
      shadowAlpha: 0.3,
    );
  }

  static ThemeData get lightTheme {
    return _buildTheme(
      brightness: Brightness.light,
      backgroundColor: AppColors.lightSurface,
      surfaceColor: AppColors.lightSurface,
      onSurfaceColor: AppColors.lightOnSurface,
      onBackgroundColor: AppColors.lightOnBackground,
      secondaryColor: AppColors.lightSecondary,
      tertiaryColor: AppColors.lightTertiary,
      cardElevation: AppDesign.lightCardElevation,
      shadowAlpha: 0.1,
    );
  }

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color backgroundColor,
    required Color surfaceColor,
    required Color onSurfaceColor,
    required Color onBackgroundColor,
    required Color secondaryColor,
    required Color tertiaryColor,
    required double cardElevation,
    required double shadowAlpha,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ThemeBuilders.buildColorScheme(brightness: brightness, surfaceColor: surfaceColor, onSurfaceColor: onSurfaceColor, secondaryColor: secondaryColor, tertiaryColor: tertiaryColor),
      appBarTheme: ThemeBuilders.buildAppBarTheme(backgroundColor: backgroundColor, onBackgroundColor: onBackgroundColor),
      scaffoldBackgroundColor: backgroundColor,
      cardTheme: ThemeBuilders.buildCardTheme(color: surfaceColor, elevation: cardElevation, shadowAlpha: shadowAlpha),
      textTheme: ThemeBuilders.buildTextTheme(onBackgroundColor: onBackgroundColor, secondaryColor: secondaryColor, tertiaryColor: tertiaryColor),
      elevatedButtonTheme: ThemeBuilders.buildElevatedButtonTheme(),
      outlinedButtonTheme: ThemeBuilders.buildOutlinedButtonTheme(),
    );
  }
}
