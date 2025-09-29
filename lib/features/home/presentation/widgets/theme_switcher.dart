import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpleThemeToggle extends ConsumerWidget {
  const SimpleThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = context.brightness;
    final isDarkMode = brightness == Brightness.dark;
    final themeNotifier = ref.read(themeProvider.notifier);

    return IconButton(
      onPressed: () async {
        await themeNotifier.toggleTheme();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(isDarkMode ? 'Cambiado a modo claro' : 'Cambiado a modo oscuro'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      icon: Icon(
        isDarkMode ? Icons.light_mode : Icons.dark_mode,
        color: context.colorScheme.onSurface,
      ),
      tooltip: isDarkMode ? 'Cambiar a modo claro' : 'Cambiar a modo oscuro',
    );
  }
}
