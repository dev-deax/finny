import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/course.dart';
import '../providers/course/course_repository_provider.dart';

final featuredCoursesProvider = FutureProvider<List<Course>>((ref) async {
  final courseRepository = ref.watch(courseRepositoryProvider);

  try {
    final courses = await courseRepository.getCourses(
      page: 1,
      pageSize: 3,
    );
    return courses;
  } catch (e) {
    return [];
  }
});
