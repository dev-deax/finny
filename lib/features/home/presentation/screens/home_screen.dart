import 'package:finny/features/courses/presentation/views/filtered_course_catalog_view.dart';
import 'package:finny/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/build_context_extension.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentBottomNavIndex = 0;
  Widget body = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: body,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: currentBottomNavIndex,
        onTap: (index) {
          setState(() {
            currentBottomNavIndex = index;
          });

          switch (index) {
            case 0:
              body = const HomeView();
              break;
            case 1:
              body = const HomeView();
              break;
            case 2:
              body = const FilteredCourseCatalogView();
              break;
            case 3:
              body = const HomeView();
              break;
          }
        },
      ),
    );
  }
}
