import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/providers/connectivity_providers.dart';
import 'package:finny/core/widgets/widgets.dart';
import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:finny/features/courses/presentation/widgets/course_description_widget.dart';
import 'package:finny/features/courses/presentation/widgets/course_header_widget.dart';
import 'package:finny/features/courses/presentation/widgets/course_info_widget.dart';
import 'package:finny/features/courses/presentation/widgets/favorite_button.dart';
import 'package:finny/features/courses/presentation/widgets/instructor_card_widget.dart';
import 'package:finny/features/courses/presentation/widgets/modules_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  static const String name = 'course-detail';
  final Course course;

  const CourseDetailScreen({
    super.key,
    required this.course,
  });

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final connectivityState = ref.watch(connectivityStateProvider);

    return connectivityState.when(
      data: (isConnected) {
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          appBar: AppBarWidget(
            title: 'Detalle del curso',
            actions: [
              FavoriteButton(
                course: widget.course,
              ),
            ],
          ),
          body: _buildContent(isConnected),
        );
      },
      loading: () => Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: const AppBarWidget(title: 'Detalle del curso'),
        body: const StateDisplayWidget(type: StateType.loading, message: 'Cargando curso...'),
      ),
      error: (_, __) => Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: const AppBarWidget(title: 'Detalle del curso'),
        body: Column(
          children: [
            OfflineBanner(),
            const Expanded(
              child: Center(
                child: Text('Error al cargar la información del curso'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(bool isConnected) {
    return Center(
      child: Container(
        width: 390,
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(
          children: [
            if (!isConnected) OfflineBanner(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CourseHeaderWidget(course: widget.course),
                    const SizedBox(height: 16),
                    CourseInfoWidget(course: widget.course),
                    const SizedBox(height: 24),
                    CourseDescriptionWidget(course: widget.course),
                    const SizedBox(height: 16),
                    InstructorCardWidget(course: widget.course),
                    const SizedBox(height: 16),
                    const ModulesListWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
