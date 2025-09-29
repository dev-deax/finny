import 'package:finny/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      onPrimaryFixed: isDark ? AppColors.darkOnPrimaryFixed : AppColors.lightOnPrimaryFixed,
      onPrimaryFixedVariant: isDark ? AppColors.darkOnPrimaryFixedVariant : AppColors.lightOnPrimaryFixedVariant,
      secondaryContainer: isDark ? AppColors.darkSecondaryContainer : AppColors.lightSecondaryContainer,
      onSecondary: isDark ? AppColors.darkOnSecondary : AppColors.lightOnSecondary,
      onSecondaryContainer: isDark ? AppColors.darkOnSecondaryContainer : AppColors.lightOnSecondaryContainer,
      tertiaryContainer: isDark ? AppColors.darkTertiaryContainer : AppColors.lightTertiaryContainer,
      onTertiary: isDark ? AppColors.darkOnTertiary : AppColors.lightOnTertiary,
      onTertiaryContainer: isDark ? AppColors.darkOnTertiaryContainer : AppColors.lightOnTertiaryContainer,
      tertiaryFixed: isDark ? AppColors.darkTertiaryFixed : AppColors.lightTertiaryFixed,
      tertiaryFixedDim: isDark ? AppColors.darkTertiaryFixedDim : AppColors.lightTertiaryFixedDim,
      onTertiaryFixed: isDark ? AppColors.darkOnTertiaryFixed : AppColors.lightOnTertiaryFixed,
      onTertiaryFixedVariant: isDark ? AppColors.darkOnTertiaryFixedVariant : AppColors.lightOnTertiaryFixedVariant,
      surfaceContainerHighest: isDark ? AppColors.darkSurfaceContainerHighest : AppColors.lightSurfaceContainerHighest,
      surfaceContainerHigh: isDark ? AppColors.darkSurfaceContainerHigh : AppColors.lightSurfaceContainerHigh,
      surfaceContainer: isDark ? AppColors.darkSurfaceContainer : AppColors.lightSurfaceContainer,
      surfaceContainerLow: isDark ? AppColors.darkSurfaceContainerLow : AppColors.lightSurfaceContainerLow,
      surfaceContainerLowest: isDark ? AppColors.darkSurfaceContainerLowest : AppColors.lightSurfaceContainerLowest,
    );
  }

  static ElevatedButtonThemeData buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
        textStyle: WidgetStateProperty.all(GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }

  static OutlinedButtonThemeData buildOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
        textStyle: WidgetStateProperty.all(GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16)),
      ),
    );
  }

  static TextTheme buildTextTheme({required Brightness brightness}) {
    final isDark = brightness == Brightness.dark;
    return GoogleFonts.interTextTheme(
      TextTheme(
        displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 57, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 45, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        displaySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 36, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        headlineLarge: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        headlineMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        headlineSmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        titleLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        titleMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        titleSmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        bodyLarge: TextStyle(fontSize: 16, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        bodyMedium: TextStyle(fontSize: 14, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        bodySmall: TextStyle(fontSize: 12, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        labelLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        labelMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
        labelSmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: isDark ? AppColors.darkOnSecondaryFixedVariant : AppColors.lightOnSecondaryFixedVariant),
      ),
    );
  }

  static IconThemeData buildIconTheme({required Brightness brightness}) {
    final isDark = brightness == Brightness.dark;
    return IconThemeData(
      color: isDark ? AppColors.darkSurfaceTint : AppColors.lightSurfaceTint,
      size: 24.0,
    );
  }
}
