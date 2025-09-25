import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final int streakDays;

  const User({required this.id, required this.name, required this.streakDays});

  @override
  List<Object> get props => [id, name, streakDays];
}

