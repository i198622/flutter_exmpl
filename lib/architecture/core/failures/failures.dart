
/// Глобальная ошибка
abstract class Failure implements Exception {
  String get title => 'Error';
  String get message => 'Error try please again later.';
}

/// Хз что произошло
class UnknownFailure extends Failure {
  @override
  String get title => 'Unknown error';

  @override
  String get message => 'Попробуйте позже';
}

/// Сетевая ошибка
class NetworkFailure extends Failure {
  @override
  String get title => 'Network error';

  @override
  String get message => 'Проверьте соединение с интернетом';
}