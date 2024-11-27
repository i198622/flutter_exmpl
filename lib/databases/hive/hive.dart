import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'hive_user_adapter.dart';

initHive() async {
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter<User>(UserAdapter());
}

class HiveDb {
  final box = Hive.box<String>('myBox');
  final user = Hive.box<User>('userBox');

  save() async {
    await box.put('key', 'value');
  }

  get() {
    final result = box.get('key', defaultValue: 'no value');
    return result;
  }
}


