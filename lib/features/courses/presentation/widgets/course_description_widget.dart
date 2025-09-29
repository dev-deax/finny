import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:flutter/material.dart';

class CourseDescriptionWidget extends StatefulWidget {
  final Course course;

  const CourseDescriptionWidget({
    super.key,
    required this.course,
  });

  @override
  State<CourseDescriptionWidget> createState() => _CourseDescriptionWidgetState();
}

class _CourseDescriptionWidgetState extends State<CourseDescriptionWidget> {
  bool _isSummaryExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descripción',
          style: context.textTheme.titleLarge?.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 8),
        Text(
          widget.course.summary,
          style: context.textTheme.labelSmall?.copyWith(
            fontSize: 16,
            color: context.colorScheme.onTertiaryFixed,
            height: 1.5,
          ),
          maxLines: _isSummaryExpanded ? null : 3,
          overflow: _isSummaryExpanded ? null : TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => setState(() => _isSummaryExpanded = !_isSummaryExpanded),
          child: Text(
            _isSummaryExpanded ? 'Ver menos' : 'Ver más',
            style: context.textTheme.labelSmall?.copyWith(
              fontSize: 16,
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
