import 'package:equatable/equatable.dart';

class LevelProductRoleSubjectModel extends Equatable {
  final String id;
  final String name;
  final List<LevelProductRoleSubjectModel> children;

  const LevelProductRoleSubjectModel({
    required this.id,
    required this.name,
    this.children = const [],
  });

  factory LevelProductRoleSubjectModel.fromJson(Map<String, dynamic> json) {
    final childrenList = json['children'] as List<dynamic>? ?? [];

    return LevelProductRoleSubjectModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      children: childrenList.map((childJson) => LevelProductRoleSubjectModel.fromJson(childJson as Map<String, dynamic>)).toList(),
    );
  }

  @override
  List<Object?> get props => [id, name, children];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'children': children.map((child) => child.toJson()).toList(),
    };
  }
}
