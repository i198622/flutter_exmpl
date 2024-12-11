import 'package:equatable/equatable.dart';

enum AuthenticationState {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  final AuthState authState;

  const AppState({
    required this.authState,
  });

  factory AppState.initial() {
    return const AppState(
      authState: AuthState(
        state: AuthenticationState.unauthenticated,
        isLoading: false,
        error: '',
      ),
    );
  }

  @override
  List<Object?> get props => [
        authState,
      ];
}

class AuthState extends Equatable {
  final AuthenticationState state;
  final bool isLoading;
  final String error;

  const AuthState({
    required this.state,
    required this.isLoading,
    required this.error,
  });

  AuthState copyWith({
    AuthenticationState? state,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      state: state ?? this.state,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        state,
        isLoading,
        error,
      ];
}
