import 'package:redux/redux.dart';
import '../models/app_state_model.dart';

AuthState userAuthStateSelector(Store<AppState> store) => store.state.authState;