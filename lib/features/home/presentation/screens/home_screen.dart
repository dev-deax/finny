import 'package:finny/features/courses/domain/entities/course.dart';
import 'package:finny/features/courses/domain/entities/progress.dart';
import 'package:finny/features/courses/domain/entities/user.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/build_context_extension.dart';
import '../widgets/app_header.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/course_card.dart';
import '../widgets/filter_section.dart';
import '../widgets/progress_section.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFilter = 'all';
  int currentBottomNavIndex = 2;
  final User user = const User(id: '1', name: 'Juan', streakDays: 1);

  final Progress progress = const Progress(totalCourses: 20, inProgressCourses: 2, completedCourses: 9, notStartedCourses: 4);

  final List<Course> courses = [
    const Course(
      id: '1',
      title: 'Planificación de Finanzas Personales',
      description: 'Mejorar tu situación y tu calidad de vida.',
      category: CourseCategory.personalFinance,
      imageUrl: 'https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=200&h=200&fit=crop',
      rating: 4.7,
      reviewCount: 23,
      status: CourseStatus.notStarted,
    ),
    const Course(
      id: '2',
      title: 'Inversión en Renta Fija',
      description: 'Un curso donde aprenderás desde cero a invertir en instrumentos...',
      category: CourseCategory.investments,
      imageUrl: 'https://images.unsplash.com/photo-1551434678-e076c223a692?w=200&h=200&fit=crop',
      rating: 4.7,
      reviewCount: 23,
      status: CourseStatus.notStarted,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: Column(
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
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: currentBottomNavIndex,
        onTap: (index) {
          setState(() {
            currentBottomNavIndex = index;
          });
        },
      ),
    );
  }
}
