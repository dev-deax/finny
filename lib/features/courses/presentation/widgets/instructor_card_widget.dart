import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/widgets/widgets.dart';
import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:flutter/material.dart';

class InstructorCardWidget extends StatelessWidget {
  final Course course;

  const InstructorCardWidget({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              child: ClipOval(
                child: NetworkSvgWithConnectivity(
                  imageUrl: course.iconUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  placeholder: Container(
                    width: 40,
                    height: 40,
                    color: context.colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.person,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  errorMessage: 'Sin conexión',
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Krishna Todelo',
                    style: context.textTheme.labelLarge,
                  ),
                  Text(
                    'CEO Finny',
                    style: context.textTheme.labelSmall?.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
