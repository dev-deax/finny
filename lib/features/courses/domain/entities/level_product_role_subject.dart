import 'package:equatable/equatable.dart';

class LevelProductRoleSubject extends Equatable {
  final String id;
  final String name;
  final List<LevelProductRoleSubject> children;

  const LevelProductRoleSubject({
    required this.id,
    required this.name,
    this.children = const [],
  });

  @override
  List<Object?> get props => [id, name, children];

  LevelProductRoleSubject copyWith({
    String? id,
    String? name,
    List<LevelProductRoleSubject>? children,
  }) {
    return LevelProductRoleSubject(
      id: id ?? this.id,
      name: name ?? this.name,
      children: children ?? this.children,
    );
  }

  @override
  String toString() {
    return 'LevelProductRoleSubject(id: $id, name: $name, children: $children)';
  }
}
