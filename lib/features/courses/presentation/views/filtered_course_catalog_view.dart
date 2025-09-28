import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extension/build_context_extension.dart';
import '../../../../core/widgets/state_widgets/state_widgets.dart';
import '../../../home/presentation/widgets/course_card.dart';
import '../../domain/entities/filter_option.dart';
import '../providers/course/course_providers.dart';
import '../providers/filter_provider.dart';
import '../providers/filtered_courses_provider.dart';
import '../widgets/filter_bar.dart';

class FilteredCourseCatalogView extends ConsumerStatefulWidget {
  const FilteredCourseCatalogView({super.key});

  @override
  ConsumerState<FilteredCourseCatalogView> createState() => _FilteredCourseCatalogViewState();
}

class _FilteredCourseCatalogViewState extends ConsumerState<FilteredCourseCatalogView> {
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
          // Barra de filtros móviles
          const FilterBar(),

          // Barra de búsqueda
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              children: [
                // Barra de búsqueda
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Buscar cursos...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                ref.read(filterStateProvider.notifier).updateSearchQuery('');
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: context.colorScheme.surfaceContainerHighest,
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Botón de búsqueda
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(filteredCoursesProvider.notifier).refreshCourses();
                  },
                  icon: const Icon(Icons.search),
                  label: const Text('Buscar'),
                ),
              ],
            ),
          ),

          // Contenido de cursos
          Expanded(
            child: _buildCourseContent(courseListState, filterState),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseContent(CourseListState courseListState, FilterState filterState) {
    if (courseListState.isLoading && courseListState.courses.isEmpty) {
      return const LoadingStateWidget(message: 'Cargando cursos...');
    }

    if (courseListState.error != null) {
      return ErrorStateWidget(
        title: 'Error al cargar cursos',
        message: courseListState.error!,
        onRetry: () => ref.read(filteredCoursesProvider.notifier).refreshCourses(),
      );
    }

    if (courseListState.courses.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.school_outlined, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'No se encontraron cursos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            filterState.hasActiveFilters
                ? 'No hay cursos que coincidan con los filtros seleccionados. Intenta ajustar los filtros o busca algo diferente.'
                : 'No hay cursos disponibles en este momento. Intenta con otros filtros o busca algo diferente.',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          if (filterState.hasActiveFilters) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(filterStateProvider.notifier).clearAllFilters();
              },
              child: const Text('Limpiar filtros'),
            ),
          ],
        ],
      );
    }

    return Column(
      children: [
        // Información de resultados
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

        // Lista de cursos
        Expanded(
          child: ListView.builder(
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
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CourseCard(course: course),
              );
            },
          ),
        ),
      ],
    );
  }
}
