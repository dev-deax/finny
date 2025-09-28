import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/widgets/badge_widget.dart';
import 'package:finny/core/widgets/image_widgets/image_widgets.dart';
import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: SvgPicture.network(
                  'https://learn.microsoft.com/en-us/media/learn/certification/course.svg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholderBuilder: (context) => ImagePlaceholderWidget(
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
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
                    Text(
                      course.title,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      course.summary,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.schedule, size: 16, color: context.colorScheme.primary),
              const SizedBox(width: 4),
              Text(
                '${course.durationInMinutes} min',
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              if (course.levels.isNotEmpty) ...[
                Icon(Icons.school, size: 16, color: context.colorScheme.primary),
                const SizedBox(width: 4),
                Text(
                  course.levels.first.toUpperCase(),
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ],
          ),
          if (course.products.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: course.products
                  .take(3)
                  .map((product) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          product,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
