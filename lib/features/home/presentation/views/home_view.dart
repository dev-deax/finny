import 'package:finny/core/widgets/widgets.dart';
import 'package:finny/features/courses/domain/entities/progress.dart';
import 'package:finny/features/courses/domain/entities/user.dart';
import 'package:finny/features/courses/presentation/providers/featured_courses_provider.dart';
import 'package:finny/features/home/presentation/widgets/app_header.dart';
import 'package:finny/features/home/presentation/widgets/course_card.dart';
import 'package:finny/features/home/presentation/widgets/progress_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  final VoidCallback? onViewAllCourses;

  const HomeView({super.key, this.onViewAllCourses});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  String selectedFilter = 'all';
  final User user = const User(id: '1', name: 'Juan', streakDays: 1);

  final Progress progress = const Progress(totalCourses: 20, inProgressCourses: 2, completedCourses: 9, notStartedCourses: 4);

  @override
  Widget build(BuildContext context) {
    final featuredCoursesAsync = ref.watch(featuredCoursesProvider);

    return Column(
      children: [
        AppHeader(userName: user.name, streakDays: user.streakDays),
        const SizedBox(height: 24),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressSection(progress: progress),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionHeaderWidget(text: 'Cursos'),
                    TextButton(
                      onPressed: () {
                        if (widget.onViewAllCourses != null) {
                          widget.onViewAllCourses!();
                        }
                      },
                      child: const Text('Ver todos'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                featuredCoursesAsync.when(
                  data: (courses) {
                    if (courses.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Text(
                            'No hay cursos disponibles',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: courses.length,
                      itemBuilder: (context, index) => CourseCard(course: courses[index]),
                    );
                  },
                  loading: () => const StateDisplayWidget(type: StateType.loading, message: 'Cargando cursos...'),
                  error: (error, stack) => StateDisplayWidget(
                    type: StateType.error,
                    message: 'Error al cargar cursos',
                    onAction: () => ref.refresh(featuredCoursesProvider),
                    actionButtonText: 'Reintentar',
                    icon: Icons.error_outline,
                    iconColor: Colors.grey,
                    title: 'Error al cargar cursos',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
