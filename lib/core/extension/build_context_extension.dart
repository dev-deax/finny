import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// Returns the current [ThemeData] brightness.
  Brightness get brightness => Theme.of(this).brightness;

  /// Returns the current [ColorScheme] from the context.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Returns the current [FocusScopeNode] from the context.
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Returns the current [TextTheme] from the context.
  TextTheme get textTheme => Theme.of(this).textTheme;
}
