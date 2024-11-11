import 'dart:async';

class CounterService {
  static final CounterService _singleton = CounterService._internal();

  factory CounterService() {
    return _singleton;
  }

  CounterService._internal();
  int counter = 0;

  final StreamController<int> _counterCtrl = StreamController.broadcast();
  Stream<int> get counterStream => _counterCtrl.stream;

  increment() {
    counter += 1;
    _counterCtrl.sink.add(counter);
  }
}