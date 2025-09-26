import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extension/build_context_extension.dart';
import '../../../../core/widgets/state_widgets/state_widgets.dart';
import '../../../courses/presentation/providers/providers.dart';
import '../widgets/course_card.dart';

class CourseCatalogView extends ConsumerStatefulWidget {
  const CourseCatalogView({super.key});

  @override
  ConsumerState<CourseCatalogView> createState() => _CourseCatalogViewState();
}

class _CourseCatalogViewState extends ConsumerState<CourseCatalogView> {
  final TextEditingController _searchController = TextEditingController();
  String selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    final courseListState = ref.watch(courseListProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                        ref.read(searchProvider.notifier).updateQuery('');
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: context.colorScheme.surfaceContainerHighest,
            ),
            onChanged: (value) {
              ref.read(searchProvider.notifier).updateQuery(value);
              if (value.isNotEmpty) {
                ref.read(courseListProvider.notifier).refreshCourses(search: value);
              } else {
                ref.read(courseListProvider.notifier).refreshCourses();
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('Todos', 'all', selectedFilter),
                _buildFilterChip('Módulos', 'module', selectedFilter),
                _buildFilterChip('Rutas', 'learning-path', selectedFilter),
                _buildFilterChip('Certificaciones', 'certification', selectedFilter),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(child: _buildCourseList(courseListState)),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(courseListProvider.notifier).loadCourses();
    });
  }

  Widget _buildCourseList(CourseListState courseListState) {
    if (courseListState.isLoading && courseListState.courses.isEmpty) {
      return const LoadingStateWidget(message: 'Cargando cursos...');
    }

    if (courseListState.error != null) {
      return ErrorStateWidget(
        title: 'Error al cargar cursos',
        message: courseListState.error!,
        onRetry: () => ref.read(courseListProvider.notifier).refreshCourses(),
      );
    }

    if (courseListState.courses.isEmpty) {
      return const EmptyStateWidget(
        title: 'No se encontraron cursos',
        message: 'No hay cursos disponibles en este momento. Intenta con otros filtros o busca algo diferente.',
        icon: Icons.school_outlined,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: courseListState.courses.length + (courseListState.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == courseListState.courses.length) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: courseListState.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => ref.read(courseListProvider.notifier).loadMoreCourses(),
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
    );
  }

  Widget _buildFilterChip(String label, String value, String selectedValue) {
    final isSelected = selectedValue == value;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            selectedFilter = value;
          });
          if (selected) {
            ref.read(searchProvider.notifier).updateType(value == 'all' ? null : value);
            ref.read(courseListProvider.notifier).refreshCourses(
                  type: value == 'all' ? null : value,
                );
          } else {
            ref.read(searchProvider.notifier).updateType(null);
            ref.read(courseListProvider.notifier).refreshCourses();
          }
        },
      ),
    );
  }
}
