
import '../models/app_state_model.dart';
import 'auth_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    authState: authReducer(state.authState, action),
  );
}