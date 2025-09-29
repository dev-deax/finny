import 'package:flutter/material.dart';

enum StateType {
  loading,
  error,
  empty,
  noInternet,
}

class StateDisplayWidget extends StatelessWidget {
  final StateType type;
  final String message;
  final String? title;
  final IconData? icon;
  final VoidCallback? onAction;
  final String? actionButtonText;
  final Color? iconColor;
  final double? loadingSize;
  final EdgeInsetsGeometry? padding;

  const StateDisplayWidget({
    super.key,
    required this.type,
    required this.message,
    this.title,
    this.icon,
    this.onAction,
    this.actionButtonText,
    this.iconColor,
    this.loadingSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(context),
            const SizedBox(height: 16),
            if (title != null) ...[
              Text(
                title!,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
            ],
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (onAction != null) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onAction,
                child: Text(actionButtonText ?? _getDefaultButtonText()),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    switch (type) {
      case StateType.loading:
        return SizedBox(
          width: loadingSize ?? 40,
          height: loadingSize ?? 40,
          child: CircularProgressIndicator(
            color: iconColor,
          ),
        );
      case StateType.error:
        return Icon(
          icon ?? Icons.error_outline,
          size: 64,
          color: iconColor ?? Colors.grey[400],
        );
      case StateType.empty:
        return Icon(
          icon ?? Icons.inbox_outlined,
          size: 64,
          color: iconColor ?? Colors.grey[400],
        );
      case StateType.noInternet:
        return Icon(
          icon ?? Icons.wifi_off_rounded,
          size: 64,
          color: iconColor ?? Colors.grey[400],
        );
    }
  }

  String _getDefaultButtonText() {
    switch (type) {
      case StateType.loading:
        return 'Cargando...';
      case StateType.error:
        return 'Reintentar';
      case StateType.empty:
        return 'Explorar';
      case StateType.noInternet:
        return 'Reintentar';
    }
  }
}
