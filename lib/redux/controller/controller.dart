import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../actions/actions.dart';
import '../models/app_state_model.dart';

abstract class SomeController {
  static ThunkAction<AppState> login({required String email}) => (Store<AppState> store) async {
    try {
      store.dispatch(
        LoginRequestAction(
          email: email,
        ),
      );

      await Future.delayed(const Duration(seconds: 2));
      store.dispatch(
        LoginSuccessAction(
          hasAccess: true,
        ),
      );
    } catch(e) {
      store.dispatch(
        LoginFailureAction(
          msg: 'Wrong password',
        ),
      );
    }
  };

  static ThunkAction<AppState> logout() => (Store<AppState> store) async {
    store.dispatch(
      const LogoutRequestAction(),
    );
  };
}
