import 'dart:ui';

import 'package:redux/redux.dart';

import '../controller/controller.dart';
import '../models/app_state_model.dart';

class AuthViewModel {
  final AuthState state;
  final VoidCallback login;
  final VoidCallback logout;

  AuthViewModel({
    required this.state,
    required this.login,
    required this.logout,
  });

  static AuthViewModel fromStore(Store<AppState> store) {
    return AuthViewModel(
      state: store.state.authState,
      login: () {
        store.dispatch(
          SomeController.login(
            email: 'simple@email.com',
          ),
        );
      },
      logout: () {
        store.dispatch(SomeController.logout());
      },
    );
  }
}
