import 'package:mobx/mobx.dart';

// Include generated file
part 'counter.g.dart';

// This is the class used by rest of your codebase
class Counter = _Counter with _$Counter;

// The store-class
abstract class _Counter with Store {
  @observable
  int value = 0;

  @observable
  late String firstName;

  @observable
  late String lastName;

  @computed
  String get fullName => '$firstName, $lastName';

  ObservableList<String> phoneNumbers = ObservableList.of([]);

  @action
  void increment() {
    value++;
  }

  @action
  Future<void> fetchPhoneNumbers() async {
    final numbers = await Future.delayed(const Duration(seconds: 2));
    phoneNumbers = ObservableList.of(numbers);
  }
}