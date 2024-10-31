import 'package:rxdart/rxdart.dart';

class MainController {
  MainController();

  final _counter = BehaviorSubject.seeded(
    CounterState(
      counter: 0,
    ),
  );

  ValueStream<CounterState> get counter => _counter.stream;

  increment() {
    _counter.sink.add(
      _counter.value.copyWith(
        counter: _counter.value.counter + 1,
      ),
    );
  }
}

class CounterState {
  final int counter;

  CounterState({
    required this.counter,
  });

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is CounterState &&
      other.runtimeType == runtimeType &&
      other.counter == counter;

  @override
  int get hashCode => counter.hashCode;
}
