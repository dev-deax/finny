import 'package:flutter/material.dart';

import '../extension/build_context_extension.dart';

class OfflineBanner extends StatelessWidget {
  final String? customMessage;

  const OfflineBanner({
    super.key,
    this.customMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.errorContainer.withValues(alpha: 0.9),
            context.colorScheme.errorContainer.withValues(alpha: 0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.error.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.colorScheme.error,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.wifi_off_rounded,
              color: context.colorScheme.onError,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sin conexión a internet',
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colorScheme.onErrorContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (customMessage != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    customMessage ?? '',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onErrorContainer,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
