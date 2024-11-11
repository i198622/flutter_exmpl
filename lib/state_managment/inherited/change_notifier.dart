import 'package:flutter/material.dart';

class ExampleCounterNotifier extends ChangeNotifier {
  int counter = 1;

  increment() {
    counter += 1;
    notifyListeners();
  }
}