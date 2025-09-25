import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFF8B5CF6);
  static const Color lightPurple = Color(0xFFF3F0FF);
  static const Color darkGray = Color(0xFF374151);
  static const Color lightGray = Color(0xFF9CA3AF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryPurple, brightness: Brightness.light),
      appBarTheme: const AppBarTheme(
        backgroundColor: white,
        foregroundColor: black,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      scaffoldBackgroundColor: white,
      cardTheme: CardThemeData(
        color: white,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: black),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: black),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: darkGray),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: lightGray),
      ),
    );
  }
}
