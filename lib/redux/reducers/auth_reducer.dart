import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/app_state_model.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, LoginRequestAction>(_login).call,
  TypedReducer<AuthState, LoginSuccessAction>(_loginSuccess).call,
  TypedReducer<AuthState, LoginFailureAction>(_loginFailure).call,
  TypedReducer<AuthState, LogoutRequestAction>(_logout).call,
]);

AuthState _login(AuthState auth, LoginRequestAction action) {
  return auth.copyWith(isLoading: true);
}

AuthState _loginSuccess(AuthState auth, LoginSuccessAction action) {
  return auth.copyWith(
    isLoading: false,
    state: AuthenticationState.authenticated,
  );
}

AuthState _loginFailure(AuthState auth, LoginFailureAction action) {
  return auth.copyWith(
    isLoading: false,
    error: action.msg,
  );
}

AuthState _logout(AuthState auth, LogoutRequestAction action) {
  return auth.copyWith(
    isLoading: false,
    state: AuthenticationState.unauthenticated,
  );
}
