import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/widgets/widgets.dart';
import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:finny/features/courses/presentation/providers/favorites/favorites_provider.dart';
import 'package:finny/features/home/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  static const String name = 'favorites';

  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedLevel;
  String? _selectedType;
  String? _selectedDuration;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteCoursesAsync = ref.watch(favoriteCoursesProvider);

    return favoriteCoursesAsync.when(
      data: (favoriteCourses) {
        final filteredCourses = _filterCourses(favoriteCourses, _searchQuery);
        return Column(
          children: [
            SearchBarWidget(
              controller: _searchController,
              hintText: 'Buscar en favoritos...',
              onClear: () {
                _searchController.clear();
              },
            ),
            Expanded(
              child: filteredCourses.isEmpty ? _buildEmptyState(context, favoriteCourses.isEmpty) : _buildFavoritesList(context, filteredCourses, favoriteCourses.length),
            ),
          ],
        );
      },
      loading: () => const StateDisplayWidget(type: StateType.loading, message: 'Cargando favoritos...'),
      error: (error, stack) => StateDisplayWidget(type: StateType.error, message: 'Error al cargar favoritos', onAction: () => ref.refresh(favoritesNotifierProvider)),
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isNoFavorites) {
    return EmptyStateWidgetUnified(
      type: isNoFavorites ? EmptyStateType.noFavorites : EmptyStateType.noResults,
      onAction: isNoFavorites ? () => context.pop() : () => _searchController.clear(),
    );
  }

  Widget _buildFavoritesList(BuildContext context, List<Course> courses, int totalFavorites) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          child: Text(
            _searchQuery.isEmpty ? '$totalFavorites ${totalFavorites == 1 ? 'favorito' : 'favoritos'}' : '${courses.length} de $totalFavorites ${totalFavorites == 1 ? 'favorito' : 'favoritos'}',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: courses.length,
            itemBuilder: (context, index) => CourseCard(course: courses[index]),
          ),
        ),
      ],
    );
  }

  List<Course> _filterCourses(List<Course> courses, String query) {
    return courses.where((course) {
      final matchesSearch = query.isEmpty || course.title.toLowerCase().contains(query.toLowerCase()) || course.summary.toLowerCase().contains(query.toLowerCase()) || course.type.toLowerCase().contains(query.toLowerCase());

      final matchesLevel = _selectedLevel == null || course.levels.contains(_selectedLevel!);

      final matchesType = _selectedType == null || course.type.toLowerCase() == _selectedType!.toLowerCase();

      final matchesDuration = _selectedDuration == null || _matchesDurationFilter(course.durationInMinutes, _selectedDuration!);

      return matchesSearch && matchesLevel && matchesType && matchesDuration;
    }).toList();
  }

  bool _matchesDurationFilter(int durationInMinutes, String durationFilter) {
    switch (durationFilter) {
      case 'short':
        return durationInMinutes < 30;
      case 'medium':
        return durationInMinutes >= 30 && durationInMinutes <= 60;
      case 'long':
        return durationInMinutes > 60;
      default:
        return true;
    }
  }
}
