import 'package:finny/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeBuilders {
  static AppBarTheme buildAppBarTheme() {
    return const AppBarTheme(elevation: 0, centerTitle: true);
  }

  static CardThemeData buildCardTheme({required double elevation, required double shadowAlpha}) {
    return CardThemeData(
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(8),
    );
  }

  static ColorScheme buildColorScheme({required Brightness brightness}) {
    final isDark = brightness == Brightness.dark;
    return ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: AppColors.primaryPurple,
      surface: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      onSurface: isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
      onSurfaceVariant: isDark ? AppColors.darkOnSurfaceVariant : AppColors.lightOnSurfaceVariant,
      secondary: isDark ? AppColors.darkSecondary : AppColors.lightSecondary,
      tertiary: isDark ? AppColors.darkTertiary : AppColors.lightTertiary,
      inverseSurface: isDark ? AppColors.darkInverseSurface : AppColors.lightInverseSurface,
      onInverseSurface: isDark ? AppColors.darkOnInverseSurface : AppColors.lightOnInverseSurface,
      inversePrimary: isDark ? AppColors.darkInversePrimary : AppColors.lightInversePrimary,
      surfaceTint: isDark ? AppColors.darkSurfaceTint : AppColors.lightSurfaceTint,
      error: isDark ? AppColors.darkError : AppColors.lightError,
      onError: isDark ? AppColors.darkOnError : AppColors.lightOnError,
      errorContainer: isDark ? AppColors.darkErrorContainer : AppColors.lightErrorContainer,
      onErrorContainer: isDark ? AppColors.darkOnErrorContainer : AppColors.lightOnErrorContainer,
      outline: isDark ? AppColors.darkOutline : AppColors.lightOutline,
      outlineVariant: isDark ? AppColors.darkOutlineVariant : AppColors.lightOutlineVariant,
      shadow: isDark ? AppColors.darkShadow : AppColors.lightShadow,
      scrim: isDark ? AppColors.darkScrim : AppColors.lightScrim,
      primary: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
      onPrimary: isDark ? AppColors.darkOnPrimary : AppColors.lightOnPrimary,
      primaryContainer: isDark ? AppColors.darkPrimaryContainer : AppColors.lightPrimaryContainer,
      onPrimaryContainer: isDark ? AppColors.darkOnPrimaryContainer : AppColors.lightOnPrimaryContainer,
      secondaryContainer: isDark ? AppColors.darkSecondaryContainer : AppColors.lightSecondaryContainer,
      onSecondary: isDark ? AppColors.darkOnSecondary : AppColors.lightOnSecondary,
      onSecondaryContainer: isDark ? AppColors.darkOnSecondaryContainer : AppColors.lightOnSecondaryContainer,
      tertiaryContainer: isDark ? AppColors.darkTertiaryContainer : AppColors.lightTertiaryContainer,
      onTertiary: isDark ? AppColors.darkOnTertiary : AppColors.lightOnTertiary,
      onTertiaryContainer: isDark ? AppColors.darkOnTertiaryContainer : AppColors.lightOnTertiaryContainer,
    );
  }

  static ElevatedButtonThemeData buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
        textStyle: WidgetStateProperty.all(const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }

  static OutlinedButtonThemeData buildOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
        textStyle: WidgetStateProperty.all(const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      ),
    );
  }

  static TextTheme buildTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      titleMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      titleSmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      bodySmall: TextStyle(fontSize: 12),
      labelLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      labelMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      labelSmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
    );
  }
}
