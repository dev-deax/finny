import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// Returns the current [ThemeData] brightness.
  Brightness get brightness => Theme.of(this).brightness;

  /// Returns the current [ColorScheme] from the context.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Returns the current [FocusScopeNode] from the context.
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Returns true if the current theme is dark.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Returns true if the current theme is light.
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  /// Returns the current [MediaQueryData] from the context.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the current [NavigatorState] from the context.
  NavigatorState get navigator => Navigator.of(this);

  /// Returns the current [ScaffoldMessengerState] from the context.
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Returns the current screen height.
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Returns the current [Size] of the screen.
  Size get screenSize => MediaQuery.of(this).size;

  /// Returns the current screen width.
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Returns the current [TextTheme] from the context.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns the current [ThemeData] from the context.
  ThemeData get theme => Theme.of(this);
}
