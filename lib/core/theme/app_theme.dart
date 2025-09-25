import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFF8B5CF6);
  static const Color lightPurple = Color(0xFFF3F0FF);
  static const Color darkPurple = Color(0xFF6D28D9);
  static const Color purpleAccent = Color(0xFFA855F7);

  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF000000);
  static const Color lightOnBackground = Color(0xFF000000);
  static const Color lightSecondary = Color(0xFF6B7280);
  static const Color lightTertiary = Color(0xFF9CA3AF);

  static const Color darkBackground = Color(0xFF0F0F0F);
  static const Color darkSurface = Color(0xFF1A1A1A);
  static const Color darkOnSurface = Color(0xFFFFFFFF);
  static const Color darkOnBackground = Color(0xFFFFFFFF);
  static const Color darkSecondary = Color(0xFF9CA3AF);
  static const Color darkTertiary = Color(0xFF6B7280);

  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  static const Color streakColor = Color(0xFF8B5CF6);
  static const Color progressCardColor = Color(0xFF8B5CF6);
  static const Color filterActiveColor = Color(0xFF8B5CF6);
  static const Color filterInactiveColor = Color(0xFFF3F4F6);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(primary: primaryPurple, secondary: darkPurple, surface: darkSurface, onPrimary: Colors.white, onSecondary: Colors.white, onSurface: darkOnSurface, outline: darkTertiary, shadow: Colors.black26),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        foregroundColor: darkOnBackground,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(color: darkOnBackground, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      scaffoldBackgroundColor: darkBackground,
      cardTheme: CardThemeData(
        color: darkSurface,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: darkOnBackground),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: darkOnBackground),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: darkOnBackground),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: darkSecondary),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: darkTertiary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryPurple,
          side: const BorderSide(color: primaryPurple),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(primary: primaryPurple, secondary: lightPurple, surface: lightSurface, onPrimary: Colors.white, onSecondary: primaryPurple, onSurface: lightOnSurface, outline: lightTertiary, shadow: Colors.black12),
      appBarTheme: const AppBarTheme(
        foregroundColor: lightOnBackground,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(color: lightOnBackground, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      scaffoldBackgroundColor: lightSurface,
      cardTheme: CardThemeData(
        color: lightSurface,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: lightOnBackground),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: lightOnBackground),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: lightOnBackground),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: lightSecondary),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: lightTertiary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryPurple,
          side: const BorderSide(color: primaryPurple),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
