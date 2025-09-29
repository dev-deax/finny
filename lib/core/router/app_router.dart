import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/courses/domain/entities/course.dart';
import '../../features/courses/presentation/screens/course_detail_screen.dart';
import '../../features/courses/presentation/views/course_catalog_view.dart';
import '../../features/home/presentation/screens/home_screen.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String courseDetailRoute = '/course-detail';
  static const String favoritesRoute = '/favorites';
  static const String coursesRoute = '/courses';

  static final GoRouter router = GoRouter(
    initialLocation: homeRoute,
    routes: [
      GoRoute(
        path: homeRoute,
        name: HomeScreen.name,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: courseDetailRoute,
        name: CourseDetailScreen.name,
        builder: (BuildContext context, GoRouterState state) {
          final course = state.extra as Course?;
          if (course == null) {
            return const Scaffold(
              body: Center(
                child: Text('Error: Curso no encontrado'),
              ),
            );
          }
          return CourseDetailScreen(course: course);
        },
      ),
      GoRoute(
        path: coursesRoute,
        name: 'courses',
        builder: (BuildContext context, GoRouterState state) {
          return const CourseCatalogView();
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
}
