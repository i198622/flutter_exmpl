import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class User {
  final int id;
  final String name;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.age,
  });

  factory User.fromDb(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      name: data['name'],
      age: data['age'],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, age: $age}';
  }
}

class SqlDb {
  late final Database _db;

  SqlDb() {
    init();
  }

  init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insert(User user) async {
    await _db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<User> getUser({
    required int id,
  }) async {
    final result = await _db.query(
      'users',
      where: 'id=?',
      whereArgs: [id],
      limit: 1,
    );

    return User.fromDb(result.first);
  }
}