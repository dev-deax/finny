
class StringUtils {
  /// Limpia las etiquetas HTML de un texto
  ///
  /// Elimina todas las etiquetas HTML y convierte las entidades HTML comunes
  /// a sus caracteres correspondientes.
  ///
  /// Parámetros:
  /// - [htmlString]: La cadena que contiene HTML a limpiar
  ///
  /// Retorna:
  /// Una cadena limpia sin etiquetas HTML
  ///
  /// Ejemplo:
  /// ```dart
  /// String htmlText = '<p>Hola <strong>mundo</strong>!</p>';
  /// String cleanText = StringUtils.clearHtml(htmlText); // "Hola mundo!"
  /// ```
  static String clearHtml(String htmlString) {
    if (htmlString.isEmpty) return htmlString;

    final RegExp htmlTagRegex = RegExp(r'<[^>]*>');

    String cleaned = htmlString.replaceAll(htmlTagRegex, '');

    cleaned = cleaned
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&ndash;', '–')
        .replaceAll('&mdash;', '—')
        .replaceAll('&hellip;', '…')
        .replaceAll('&copy;', '©')
        .replaceAll('&reg;', '®')
        .replaceAll('&trade;', '™');

    cleaned = cleaned.replaceAll(RegExp(r'\s+'), ' ').trim();

    return cleaned;
  }
}
