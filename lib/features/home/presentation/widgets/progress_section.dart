import 'package:finny/core/widgets/widgets.dart';
import 'package:finny/features/courses/domain/entities/progress.dart';
import 'package:flutter/material.dart';

import 'progress_card.dart';

class ProgressSection extends StatelessWidget {
  final Progress progress;

  const ProgressSection({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeaderWidget(text: 'Tu progreso'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProgressCard(number: progress.totalCourses, label: 'Cursos'),
            const SizedBox(width: 8),
            ProgressCard(number: progress.inProgressCourses, label: 'En curso'),
            const SizedBox(width: 8),
            ProgressCard(number: progress.completedCourses, label: 'Completos'),
            const SizedBox(width: 8),
            ProgressCard(number: progress.notStartedCourses, label: 'Sin iniciar'),
          ],
        ),
      ],
    );
  }
}
