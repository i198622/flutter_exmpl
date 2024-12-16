import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/data_class.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;

  AuthCubit(this._loginUseCase) : super(AuthState.initial());

  login() async {
    emit(
      state.copyWith(
        loading: true,
        error: null,
      ),
    );

    final result = await _loginUseCase();

    if (result is DataSuccess) {
      emit(
        state.copyWith(
          status: AuthenticatedState.authorized,
          tokenInfo: result.data,
        ),
      );
    }

    if (result is DataFailed) {
      emit(
        state.copyWith(
          status: AuthenticatedState.unauthorized,
          tokenInfo: const TokenInfoEntity(
            accessToken: '',
            refreshToken: '',
          ),
          loading: false,
          error: result.error,
        ),
      );
    }
  }

  logout() {
    emit(
      state.copyWith(
        loading: false,
        error: null,
        status: AuthenticatedState.unauthorized,
        tokenInfo: const TokenInfoEntity(
          accessToken: '',
          refreshToken: '',
        ),
      ),
    );
  }
}
