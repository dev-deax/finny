import 'package:flutter/material.dart';

class ThemeBuilders {
  static AppBarTheme buildAppBarTheme({required Color backgroundColor, required Color onBackgroundColor}) {
    return AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: onBackgroundColor),
      titleTextStyle: TextStyle(color: onBackgroundColor, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  static CardThemeData buildCardTheme({required Color color, required double elevation, required double shadowAlpha}) {
    return CardThemeData(
      color: color,
      elevation: elevation,
      shadowColor: color.withValues(alpha: shadowAlpha),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(8),
    );
  }

  static ColorScheme buildColorScheme({required Brightness brightness, required Color surfaceColor, required Color onSurfaceColor, required Color secondaryColor, required Color tertiaryColor}) {
    final bool isDark = brightness == Brightness.dark;
    return ColorScheme(
      brightness: brightness,
      primary: isDark ? surfaceColor : surfaceColor,
      onPrimary: isDark ? onSurfaceColor : onSurfaceColor,
      secondary: secondaryColor,
      onSecondary: onSurfaceColor,
      error: isDark ? const Color(0xFFEF4444) : const Color(0xFFEF4444),
      onError: isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
      surface: surfaceColor,
      onSurface: onSurfaceColor,
      tertiary: tertiaryColor,
      onTertiary: onSurfaceColor,
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
        side: WidgetStateProperty.all(const BorderSide(color: Color(0xFF8B5CF6), width: 2)),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
        textStyle: WidgetStateProperty.all(const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      ),
    );
  }

  static TextTheme buildTextTheme({required Color onBackgroundColor, required Color secondaryColor, required Color tertiaryColor}) {
    return TextTheme(
      titleLarge: TextStyle(color: onBackgroundColor, fontWeight: FontWeight.bold, fontSize: 24),
      titleMedium: TextStyle(color: onBackgroundColor, fontWeight: FontWeight.w600, fontSize: 20),
      titleSmall: TextStyle(color: onBackgroundColor, fontWeight: FontWeight.w500, fontSize: 16),
      bodyLarge: TextStyle(color: onBackgroundColor, fontSize: 16),
      bodyMedium: TextStyle(color: secondaryColor, fontSize: 14),
      bodySmall: TextStyle(color: tertiaryColor, fontSize: 12),
      labelLarge: TextStyle(color: onBackgroundColor, fontWeight: FontWeight.w600, fontSize: 14),
      labelMedium: TextStyle(color: secondaryColor, fontWeight: FontWeight.w500, fontSize: 12),
      labelSmall: TextStyle(color: tertiaryColor, fontWeight: FontWeight.w400, fontSize: 10),
    );
  }
  
}
