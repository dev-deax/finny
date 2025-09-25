import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class SimpleThemeToggle extends StatelessWidget {
  const SimpleThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final isDarkMode = brightness == Brightness.dark;

    return IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isDarkMode ? 'Cambiar a modo claro' : 'Cambiar a modo oscuro'), duration: const Duration(seconds: 1)));
      },
      icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode, color: context.colorScheme.onSurface),
      tooltip: isDarkMode ? 'Cambiar a modo claro' : 'Cambiar a modo oscuro',
    );
  }
}
