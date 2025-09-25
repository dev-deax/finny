import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String id;
  final String title;
  final String description;
  final CourseCategory category;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final CourseStatus status;

  const Course({required this.id, required this.title, required this.description, required this.category, required this.imageUrl, required this.rating, required this.reviewCount, required this.status});

  @override
  List<Object> get props => [id, title, description, category, imageUrl, rating, reviewCount, status];
}

enum CourseCategory {
  personalFinance('Finanzas Personales', '\$'),
  investments('Inversiones', '💰');

  final String displayName;
  final String icon;
  const CourseCategory(this.displayName, this.icon);
}

enum CourseStatus {
  completed('Completado'),
  inProgress('En progreso'),
  notStarted('No iniciado');

  final String displayName;
  const CourseStatus(this.displayName);
}
