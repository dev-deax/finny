import 'package:cached_network_image/cached_network_image.dart';
import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/widgets/badge_widget.dart';
import 'package:finny/core/widgets/image_widgets/image_widgets.dart';
import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:flutter/material.dart';

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
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: course.socialImageUrl.isNotEmpty ? course.socialImageUrl : course.iconUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => ImagePlaceholderWidget(
                    width: 80,
                    height: 80,
                  ),
                  errorWidget: (context, url, error) => ImageErrorWidget(
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
                        if (course.popularity > 0.7) ...[
                          const SizedBox(width: 8),
                          BadgeWidget(
                            text: 'POPULAR',
                            icon: const Icon(Icons.trending_up, size: 12),
                            backgroundColor: Colors.orange.withValues(alpha: 0.1),
                            textColor: Colors.orange,
                          ),
                        ],
                        if (course.rating.average > 4.5) ...[
                          const SizedBox(width: 8),
                          BadgeWidget(
                            text: 'DESTACADO',
                            icon: const Icon(Icons.star, size: 12),
                            backgroundColor: Colors.amber.withValues(alpha: 0.1),
                            textColor: Colors.amber,
                          ),
                        ],
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
              Icon(Icons.star, size: 16, color: context.colorScheme.secondary),
              const SizedBox(width: 4),
              Text(
                '${course.rating.average.toStringAsFixed(1)} (${course.rating.count})',
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.secondary,
                ),
              ),
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
