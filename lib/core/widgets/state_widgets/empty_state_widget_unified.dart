import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

enum EmptyStateType {
  noResults,
  noFavorites,
  noCourses,
  noInternet,
  error,
}

class EmptyStateWidgetUnified extends StatelessWidget {
  final EmptyStateType type;
  final String? customTitle;
  final String? customMessage;
  final VoidCallback? onAction;
  final String? actionText;
  final IconData? customIcon;

  const EmptyStateWidgetUnified({
    super.key,
    required this.type,
    this.customTitle,
    this.customMessage,
    this.onAction,
    this.actionText,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              customIcon ?? _getDefaultIcon(),
              size: 80,
              color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 24),
            Text(
              customTitle ?? _getDefaultTitle(),
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              customMessage ?? _getDefaultMessage(),
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (onAction != null) ...[
              const SizedBox(height: 32),
              _buildActionButton(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onAction,
      icon: Icon(_getActionIcon()),
      label: Text(actionText ?? _getDefaultActionText()),
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  IconData _getDefaultIcon() {
    switch (type) {
      case EmptyStateType.noResults:
        return Icons.search_off;
      case EmptyStateType.noFavorites:
        return Icons.favorite_border;
      case EmptyStateType.noCourses:
        return Icons.school_outlined;
      case EmptyStateType.noInternet:
        return Icons.wifi_off_rounded;
      case EmptyStateType.error:
        return Icons.error_outline;
    }
  }

  String _getDefaultTitle() {
    switch (type) {
      case EmptyStateType.noResults:
        return 'No se encontraron resultados';
      case EmptyStateType.noFavorites:
        return 'No tienes cursos favoritos';
      case EmptyStateType.noCourses:
        return 'No se encontraron cursos';
      case EmptyStateType.noInternet:
        return 'Sin conexión a internet';
      case EmptyStateType.error:
        return 'Error al cargar';
    }
  }

  String _getDefaultMessage() {
    switch (type) {
      case EmptyStateType.noResults:
        return 'Intenta con otros términos de búsqueda o limpia los filtros.';
      case EmptyStateType.noFavorites:
        return 'Explora nuestros cursos y marca como favoritos los que más te interesen.\nLos favoritos se guardan localmente y están disponibles offline.';
      case EmptyStateType.noCourses:
        return 'No hay cursos disponibles en este momento. Intenta con otros filtros o busca algo diferente.';
      case EmptyStateType.noInternet:
        return 'Los cursos no están disponibles sin conexión. Solo puedes ver tus favoritos guardados.';
      case EmptyStateType.error:
        return 'Ocurrió un error inesperado. Intenta nuevamente.';
    }
  }

  String _getDefaultActionText() {
    switch (type) {
      case EmptyStateType.noResults:
        return 'Limpiar búsqueda';
      case EmptyStateType.noFavorites:
        return 'Explorar cursos';
      case EmptyStateType.noCourses:
        return 'Reintentar';
      case EmptyStateType.noInternet:
        return 'Reintentar';
      case EmptyStateType.error:
        return 'Reintentar';
    }
  }

  IconData _getActionIcon() {
    switch (type) {
      case EmptyStateType.noResults:
        return Icons.clear;
      case EmptyStateType.noFavorites:
        return Icons.school;
      case EmptyStateType.noCourses:
        return Icons.refresh;
      case EmptyStateType.noInternet:
        return Icons.refresh;
      case EmptyStateType.error:
        return Icons.refresh;
    }
  }
}
