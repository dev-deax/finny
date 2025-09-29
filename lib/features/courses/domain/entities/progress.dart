import 'package:equatable/equatable.dart';

class Progress extends Equatable {
  final int totalCourses;
  final int inProgressCourses;
  final int completedCourses;
  final int notStartedCourses;

  const Progress({
    required this.totalCourses,
    required this.inProgressCourses,
    required this.completedCourses,
    required this.notStartedCourses,
  });

  @override
  List<Object> get props => [totalCourses, inProgressCourses, completedCourses, notStartedCourses];
}
