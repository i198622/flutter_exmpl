import 'package:flutter/cupertino.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    switch (task) {
      // Future.value(false)
    }
    return Future.value(true);
  });
}

void main() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager().registerOneOffTask(
    'task-identifier',
    'simpleTask',
    inputData: {},
  );

  // runApp(app);
}
