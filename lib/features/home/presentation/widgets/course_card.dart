import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/widgets/badge_widget.dart';
import 'package:finny/core/widgets/image_widgets/image_widgets.dart';
import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:finny/features/courses/presentation/screens/course_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CourseCard extends ConsumerWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 358,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colorScheme.secondaryFixed, width: 1),
        boxShadow: [BoxShadow(color: context.colorScheme.shadow.withValues(alpha: 0.1), blurRadius: 2, offset: const Offset(0, 1), spreadRadius: 0)],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            context.pushNamed(
              CourseDetailScreen.name,
              extra: course,
            );
          },
          child: _buildImageInfo(context),
        ),
      ),
    );
  }

  Row _buildImageInfo(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImage(),
        const SizedBox(width: 16),
        Expanded(child: _buildInfo(context)),
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    return SizedBox(
      width: 206,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BadgeWidget(
                text: course.type.toUpperCase(),
                icon: const Icon(Icons.book, size: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildTitleSummary(context),
          const SizedBox(height: 8),
          _buildInfoAdditional(context),
        ],
      ),
    );
  }

  Widget _buildTitleSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course.title,
          style: context.textTheme.labelMedium?.copyWith(fontSize: 12, color: context.colorScheme.outlineVariant),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          course.summary,
          style: context.textTheme.labelSmall?.copyWith(fontSize: 12, color: context.colorScheme.outline),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildInfoAdditional(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BadgeWidget(
          icon: const Icon(Icons.schedule, size: 12),
          text: '${course.durationInHours} horas',
          textStyle: context.textTheme.labelMedium,
          backgroundColor: context.colorScheme.surface,
        ),
        if (course.levels.isNotEmpty)
          BadgeWidget(
            icon: const Icon(Icons.school, size: 12),
            text: course.levels.first.toUpperCase(),
            textStyle: context.textTheme.labelMedium,
            backgroundColor: context.colorScheme.surface,
          ),
      ],
    );
  }

  ClipRRect _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: NetworkSvgWithConnectivity(
        imageUrl: course.iconUrl,
        width: 112,
        height: 109,
        fit: BoxFit.cover,
        placeholder: ImagePlaceholderWidget(
          width: 112,
          height: 109,
        ),
        errorMessage: 'Sin conexión',
      ),
    );
  }
}
