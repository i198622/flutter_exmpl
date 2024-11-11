class CounterModel {
  CounterModel({
    this.counter = 0,
  });

  final int counter;

  CounterModel copyWith({
    final int? counter,
  }) {
    return CounterModel(
      counter: counter ?? this.counter,
    );
  }
}