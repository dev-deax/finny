import 'package:finny/features/courses/domain/entities/module.dart';
import 'package:finny/features/courses/domain/entities/progress.dart';
import 'package:finny/features/courses/domain/entities/user.dart';
import 'package:finny/features/home/presentation/widgets/app_header.dart';
import 'package:finny/features/home/presentation/widgets/course_card.dart';
import 'package:finny/features/home/presentation/widgets/filter_section.dart';
import 'package:finny/features/home/presentation/widgets/progress_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedFilter = 'all';
  final User user = const User(id: '1', name: 'Juan', streakDays: 1);

  final Progress progress = const Progress(totalCourses: 20, inProgressCourses: 2, completedCourses: 9, notStartedCourses: 4);

  final List<Module> courses = [
    const Module(
      summary: 'Mejorar tu situación y tu calidad de vida.',
      levels: ['beginner'],
      roles: ['student'],
      products: ['finny'],
      subjects: ['finanzas'],
      uid: '1',
      type: 'module',
      title: 'Planificación de Finanzas Personales',
      durationInMinutes: 120,
      rating: ModuleRating(count: 10, average: 4.5),
      popularity: 0.8,
      iconUrl: 'https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=200&h=200&fit=crop',
      socialImageUrl: 'https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=400&h=200&fit=crop',
      locale: 'es-es',
      lastModified: '2024-01-01T00:00:00Z',
      url: 'https://example.com/course/1',
      firstUnitUrl: 'https://example.com/course/1/unit/1',
      units: ['unit1', 'unit2'],
      numberOfChildren: 2,
    ),
    const Module(
      summary: 'Un curso donde aprenderás desde cero a invertir en instrumentos...',
      levels: ['intermediate'],
      roles: ['student'],
      products: ['finny'],
      subjects: ['inversiones'],
      uid: '2',
      type: 'module',
      title: 'Inversión en Renta Fija',
      durationInMinutes: 180,
      rating: ModuleRating(count: 15, average: 4.2),
      popularity: 0.7,
      iconUrl: 'https://images.unsplash.com/photo-1551434678-e076c223a692?w=200&h=200&fit=crop',
      socialImageUrl: 'https://images.unsplash.com/photo-1551434678-e076c223a692?w=400&h=200&fit=crop',
      locale: 'es-es',
      lastModified: '2024-01-01T00:00:00Z',
      url: 'https://example.com/course/2',
      firstUnitUrl: 'https://example.com/course/2/unit/1',
      units: ['unit1', 'unit2', 'unit3'],
      numberOfChildren: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(userName: user.name, streakDays: user.streakDays),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ProgressSection(progress: progress),
                const SizedBox(height: 32),
                FilterSection(
                  selectedFilter: selectedFilter,
                  onFilterChanged: (filter) {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ...courses.map((course) => CourseCard(course: course)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
