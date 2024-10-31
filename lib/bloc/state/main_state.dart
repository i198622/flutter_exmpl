import 'package:equatable/equatable.dart';

enum ContentState {
  idle,
  loading,
  error,
  success,
}

class MainState extends Equatable {
  final ContentState loading;
  final String result;

  const MainState({
    required this.loading,
    required this.result,
  });

  factory MainState.initial() {
    return const MainState(
      loading: ContentState.idle,
      result: '',
    );
  }

  copyWith({
    ContentState? loading,
    String? result,
  }) {
    return MainState(
      loading: loading ?? this.loading,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        result,
      ];
}
