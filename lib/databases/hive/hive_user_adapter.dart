import 'package:hive_flutter/hive_flutter.dart';

part 'hive_user_adapter.g.dart';
// flutter packages pub run build_runner build
@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime createdAt;

  User({
    required this.name,
    required this.createdAt,
  });
}