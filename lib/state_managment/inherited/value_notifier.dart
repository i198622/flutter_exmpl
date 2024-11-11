import 'package:flutter/material.dart';

import '../models/counter_model.dart';

class CounterNotifier extends ValueNotifier<CounterModel> {
  CounterNotifier(super.state);

  void increment() {
    value = value.copyWith(counter: value.counter + 1);
  }
}

class InheritedProvider extends InheritedWidget {
  const InheritedProvider({
    super.key,
    required super.child,
    required this.notifier,
  });

  final CounterNotifier notifier;

  static CounterNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedProvider>()!
        .notifier;
  }

  @override
  bool updateShouldNotify(InheritedProvider oldWidget) {
    return notifier != oldWidget.notifier;
  }
}

// class CounterNotifier extends ChangeNotifier {
//   int counter = 1;
//
//   increment() {
//     counter += 1;
//     notifyListeners();
//   }
// }