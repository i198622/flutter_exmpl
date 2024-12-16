import 'package:equatable/equatable.dart';

import '../../../core/failures/failures.dart';
import '../../../domain/entities/login_entity.dart';

enum AuthenticatedState {
  authorized,
  unauthorized,
}

class AuthState extends Equatable {
  final AuthenticatedState status;
  final TokenInfoEntity tokenInfo;
  final bool loading;
  final Failure? error;

  const AuthState({
    required this.status,
    required this.loading,
    required this.tokenInfo,
    required this.error,
  });

  factory AuthState.initial() {
    return const AuthState(
      status: AuthenticatedState.unauthorized,
      loading: false,
      tokenInfo: TokenInfoEntity(
        accessToken: '',
        refreshToken: '',
      ),
      error: null,
    );
  }

  copyWith({
    AuthenticatedState? status,
    TokenInfoEntity? tokenInfo,
    bool? loading,
    Failure? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      tokenInfo: tokenInfo ?? this.tokenInfo,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        tokenInfo,
        loading,
        error,
      ];
}
