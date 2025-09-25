import 'package:cached_network_image/cached_network_image.dart';
import 'package:finny/core/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

import '../../features/home/domain/entities/course.dart';

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
        boxShadow: [BoxShadow(color: context.colorScheme.shadow.withValues(alpha: 0.1), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: course.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 80,
                height: 80,
                color: context.colorScheme.outline.withValues(alpha: 0.3),
                child: Icon(Icons.image, color: context.colorScheme.outline),
              ),
              errorWidget: (context, url, error) => Container(
                width: 80,
                height: 80,
                color: context.colorScheme.outline.withValues(alpha: 0.3),
                child: Icon(Icons.error, color: context.colorScheme.outline),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: context.colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(course.category.icon, style: context.textTheme.bodySmall),
                      const SizedBox(width: 4),
                      Text(
                        course.category.displayName,
                        style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: context.colorScheme.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  course.title,
                  style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  course.description,
                  style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(course.rating.toString(), style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
                    const SizedBox(width: 4),
                    Icon(Icons.star, size: 12, color: context.colorScheme.primary),
                    const SizedBox(width: 4),
                    Text('(${course.reviewCount.toString()}k reseñas)', style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
