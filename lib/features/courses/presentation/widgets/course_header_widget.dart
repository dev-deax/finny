import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/widgets/widgets.dart';
import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:flutter/material.dart';

class CourseHeaderWidget extends StatelessWidget {
  final Course course;

  const CourseHeaderWidget({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCourseImage(context),
        const SizedBox(height: 16),
        _buildCategoryTag(context),
      ],
    );
  }

  Widget _buildCourseImage(BuildContext context) {
    return NetworkSvgWithConnectivity(
      height: 268,
      width: 358,
      imageUrl: course.iconUrl,
      fit: BoxFit.cover,
      errorMessage: 'Sin conexión a internet',
      placeholder: ImagePlaceholderWidget(
        width: 358,
        height: 268,
      ),
    );
  }

  Widget _buildCategoryTag(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BadgeWidget(
              text: course.type.toUpperCase(),
              icon: const Icon(Icons.book, size: 12),
            ),
            const SizedBox(width: 12),
            if (course.levels.isNotEmpty)
              BadgeWidget(
                icon: const Icon(Icons.school, size: 12),
                text: course.levels.first.toUpperCase(),
                backgroundColor: context.colorScheme.surface,
              ),
          ],
        ),
        const SizedBox(height: 12),
        if (course.products.isNotEmpty) ...[
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: course.products
                .map((product) => Container(
                      height: 24,
                      padding: const EdgeInsets.only(top: 4, right: 8, bottom: 4, left: 8),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(product, style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.primary)),
                    ))
                .toList(),
          ),
        ],
      ],
    );
  }
}
