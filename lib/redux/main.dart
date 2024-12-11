import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'controller/controller.dart';
import 'models/app_state_model.dart';
import 'reducers/app_reducer.dart';
import 'selectors/selectors.dart';
import 'vm/auth_vm.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [thunkMiddleware],
);

class ReduxEntry extends StatelessWidget {
  const ReduxEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Redux'),
          ),
          body: Center(
            child: StoreConnector<AppState, AuthViewModel>(
              builder: (context, vm) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (vm.state.isLoading)
                      const CircularProgressIndicator(),
                    if (!vm.state.isLoading)
                      Text(vm.state.state.name),
                    const SizedBox(
                      height: 20,
                    ),
                    if (vm.state.state == AuthenticationState.unauthenticated)
                      TextButton(
                        onPressed: vm.login,
                        child: const Text('Login'),
                      )
                    else if (vm.state.state == AuthenticationState.authenticated)
                      TextButton(
                        onPressed: vm.logout,
                        child: const Text('Logout'),
                      )
                  ],
                );
              },
              converter: AuthViewModel.fromStore,
            ),
          ),
        ),
      ),
    );
  }
}
