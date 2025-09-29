import 'package:finny/features/courses/presentation/views/course_catalog_view.dart';
import 'package:finny/features/courses/presentation/views/favorites_view.dart';
import 'package:finny/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extension/build_context_extension.dart';
import '../../../../core/providers/connectivity_providers.dart';
import '../../../../core/widgets/image_widgets/image_widgets.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentBottomNavIndex = 0;
  late Widget body;

  @override
  void initState() {
    super.initState();
    body = HomeView(onViewAllCourses: _goToCourses);
  }

  void _goToCourses() {
    setState(() => currentBottomNavIndex = 1);

    setState(() => body = const CourseCatalogView());
  }

  @override
  Widget build(BuildContext context) {
    final connectivityState = ref.watch(connectivityStateProvider);

    return connectivityState.when(
      data: (isConnected) {
        return _buildScaffold(isConnected);
      },
      loading: () => _buildScaffold(true),
      error: (_, __) => _buildScaffold(false),
    );
  }

  Widget _buildScaffold(bool isConnected) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            if (!isConnected) OfflineBanner(),
            Expanded(child: body),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: currentBottomNavIndex,
        onTap: (index) {
          setState(() => currentBottomNavIndex = index);

          switch (index) {
            case 0:
              body = HomeView(onViewAllCourses: _goToCourses);
              break;
            case 1:
              body = const CourseCatalogView();
              break;
            case 2:
              body = const FavoritesView();
              break;
          }
        },
      ),
    );
  }
}
