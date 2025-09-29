import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/widgets.dart';
import '../../../home/presentation/widgets/course_card.dart';
import '../../domain/entities/filter_option.dart';
import '../providers/course/course_providers.dart';
import '../providers/filter_provider.dart';
import '../providers/filtered_courses_provider.dart';
import '../widgets/filter_bar.dart';

class CourseCatalogView extends ConsumerStatefulWidget {
  const CourseCatalogView({super.key});

  @override
  ConsumerState<CourseCatalogView> createState() => _CourseCatalogViewState();
}

class _CourseCatalogViewState extends ConsumerState<CourseCatalogView> {
  final TextEditingController _searchController = TextEditingController();

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
    ref.read(filterStateProvider.notifier).updateSearchQuery(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final courseListState = ref.watch(filteredCoursesProvider);
    final filterState = ref.watch(filterStateProvider);

    return Scaffold(
      body: Column(
        children: [
          const FilterBar(),
          SearchBarWidget(
            controller: _searchController,
            hintText: 'Buscar cursos...',
            onClear: () {
              _searchController.clear();
              ref.read(filterStateProvider.notifier).updateSearchQuery('');
            },
          ),
          Expanded(
            child: _buildCourseContent(courseListState, filterState),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseContent(CourseListState courseListState, FilterState filterState) {
    if (courseListState.isLoading && courseListState.courses.isEmpty) {
      return const StateDisplayWidget(
        type: StateType.loading,
        message: 'Cargando cursos...',
      );
    }

    if (courseListState.error != null) {
      if (courseListState.error!.contains('conexión') || courseListState.error!.contains('internet')) {
        return EmptyStateWidgetUnified(
          type: EmptyStateType.noInternet,
          onAction: () => ref.read(filteredCoursesProvider.notifier).refreshCourses(),
        );
      }

      return StateDisplayWidget(
        type: StateType.error,
        title: 'Error al cargar cursos',
        message: courseListState.error!,
        onAction: () => ref.read(filteredCoursesProvider.notifier).refreshCourses(),
        actionButtonText: 'Reintentar',
      );
    }

    if (courseListState.courses.isEmpty) {
      return EmptyStateWidgetUnified(
        type: EmptyStateType.noCourses,
        customMessage: filterState.hasActiveFilters
            ? 'No hay cursos que coincidan con los filtros seleccionados. Intenta ajustar los filtros o busca algo diferente.'
            : 'No hay cursos disponibles en este momento. Intenta con otros filtros o busca algo diferente.',
        onAction: filterState.hasActiveFilters ? () => ref.read(filterStateProvider.notifier).clearAllFilters() : null,
        actionText: filterState.hasActiveFilters ? 'Limpiar filtros' : null,
      );
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${courseListState.courses.length} resultados',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (filterState.hasActiveFilters)
                TextButton.icon(
                  onPressed: () {
                    ref.read(filterStateProvider.notifier).clearAllFilters();
                  },
                  icon: const Icon(Icons.clear_all, size: 16),
                  label: const Text('Limpiar filtros'),
                ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: courseListState.courses.length + (courseListState.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == courseListState.courses.length) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: courseListState.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () => ref.read(filteredCoursesProvider.notifier).loadMoreCourses(),
                            child: const Text('Cargar más cursos'),
                          ),
                  ),
                );
              }

              final course = courseListState.courses[index];
              return CourseCard(course: course);
            },
          ),
        ),
      ],
    );
  }
}
