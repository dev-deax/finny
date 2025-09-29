import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:finny/features/courses/presentation/providers/favorites/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButton extends ConsumerWidget {
  final Course course;
  final VoidCallback? onToggle;

  const FavoriteButton({
    super.key,
    required this.course,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(isFavoriteProvider(course.uid));

    return IconButton(
      onPressed: () {
        ref.read(favoritesNotifierProvider.notifier).toggleFavorite(course);
        onToggle?.call();
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurfaceVariant,
        size: 24,
      ),
      tooltip: isFavorite ? 'Quitar de favoritos' : 'Agregar a favoritos',
    );
  }
}
