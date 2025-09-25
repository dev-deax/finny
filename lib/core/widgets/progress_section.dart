import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

import '../../features/home/domain/entities/progress.dart';
import 'progress_card.dart';

class ProgressSection extends StatelessWidget {
  final Progress progress;

  const ProgressSection({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Tu progreso',
              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, color: context.colorScheme.onSurface),
            ),
            const SizedBox(width: 8),
            Icon(Icons.info_outline, size: 20, color: context.colorScheme.onSurface),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ProgressCard(number: progress.totalCourses, label: 'Cursos'),
            const SizedBox(width: 12),
            ProgressCard(number: progress.inProgressCourses, label: 'En curso'),
            const SizedBox(width: 12),
            ProgressCard(number: progress.completedCourses, label: 'Completos'),
            const SizedBox(width: 12),
            ProgressCard(number: progress.notStartedCourses, label: 'Sin iniciar'),
          ],
        ),
      ],
    );
  }
}
