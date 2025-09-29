import 'package:finny/core/utils/string_utils.dart';

/// Extensiones útiles para la clase String
extension StringExtensions on String {
  /// Limpia las etiquetas HTML de un texto
  ///
  /// Ejemplo:
  /// ```dart
  /// String htmlText = '<p>Hola <strong>mundo</strong>!</p>';
  /// String cleanText = htmlText.clearHtml(); // "Hola mundo!"
  /// ```
  String get clearHtml {
    return StringUtils.clearHtml(this);
  }
}
