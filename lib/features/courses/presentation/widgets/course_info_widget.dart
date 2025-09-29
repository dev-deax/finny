import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:flutter/material.dart';

class CourseInfoWidget extends StatelessWidget {
  final Course course;

  const CourseInfoWidget({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCourseTitle(context),
        const SizedBox(height: 8),
        _buildCourseSubtitle(context),
        const SizedBox(height: 16),
        _buildCourseInfo(context),
      ],
    );
  }

  Widget _buildCourseTitle(BuildContext context) {
    return Text(
      course.title,
      style: context.textTheme.titleMedium?.copyWith(
        fontSize: 24,
        color: context.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildCourseSubtitle(BuildContext context) {
    return Text(
      course.summary.split('.').first + (course.summary.contains('.') ? '.' : ''),
      style: context.textTheme.titleSmall?.copyWith(
        fontSize: 16,
        color: context.colorScheme.onTertiaryFixed,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCourseInfo(BuildContext context) {
    final hours = course.durationInMinutes ~/ 60;
    final minutes = course.durationInMinutes % 60;
    final durationText = minutes > 0 ? '$hours horas $minutes min' : '$hours horas';

    return Row(
      children: [
        _buildInfoItem(context, Icons.video_library_outlined, '3 Módulos'),
        const SizedBox(width: 12),
        _buildInfoItem(context, Icons.access_time_filled, durationText),
      ],
    );
  }

  Widget _buildInfoItem(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: context.colorScheme.outlineVariant,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: context.textTheme.titleSmall?.copyWith(
            color: context.colorScheme.outlineVariant,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
