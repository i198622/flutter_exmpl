import 'package:equatable/equatable.dart';

enum ContentState {
  idle,
  loading,
  error,
  success,
}

enum AuthenticationState {
  authenticated,
  unauthenticated,
}

class MainState extends Equatable {
  final ContentState loading;
  final AuthenticationState state;

  const MainState({
    required this.loading,
    required this.state,
  });

  factory MainState.initial() {
    return const MainState(
      loading: ContentState.idle,
      state: AuthenticationState.unauthenticated,
    );
  }

  copyWith({
    ContentState? loading,
    AuthenticationState? state,
  }) {
    return MainState(
      loading: loading ?? this.loading,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        state,
      ];
}
