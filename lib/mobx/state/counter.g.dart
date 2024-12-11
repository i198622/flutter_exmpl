// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Counter on _Counter, Store {
  Computed<String>? _$fullNameComputed;

  @override
  String get fullName => (_$fullNameComputed ??=
          Computed<String>(() => super.fullName, name: '_Counter.fullName'))
      .value;

  late final _$valueAtom = Atom(name: '_Counter.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$firstNameAtom =
      Atom(name: '_Counter.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  bool _firstNameIsInitialized = false;

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(
        value, _firstNameIsInitialized ? super.firstName : null, () {
      super.firstName = value;
      _firstNameIsInitialized = true;
    });
  }

  late final _$lastNameAtom = Atom(name: '_Counter.lastName', context: context);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  bool _lastNameIsInitialized = false;

  @override
  set lastName(String value) {
    _$lastNameAtom
        .reportWrite(value, _lastNameIsInitialized ? super.lastName : null, () {
      super.lastName = value;
      _lastNameIsInitialized = true;
    });
  }

  late final _$fetchPhoneNumbersAsyncAction =
      AsyncAction('_Counter.fetchPhoneNumbers', context: context);

  @override
  Future<void> fetchPhoneNumbers() {
    return _$fetchPhoneNumbersAsyncAction.run(() => super.fetchPhoneNumbers());
  }

  late final _$_CounterActionController =
      ActionController(name: '_Counter', context: context);

  @override
  void increment() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
firstName: ${firstName},
lastName: ${lastName},
fullName: ${fullName}
    ''';
  }
}
