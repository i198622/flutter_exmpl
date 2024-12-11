import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

enum Actions { increment, decrement }

int counterReducer(int state, action) {
  switch(action) {
    case Actions.increment:
      return state + 1;
    case Actions.decrement:
      return state - 1;
    default:
      return state;
  }
}

class SimpleReduxEntry extends StatelessWidget {
  const SimpleReduxEntry({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Store<int>(counterReducer, initialState: 0);

    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Redux'),
          ),
          body: Column(
            children: [
              StoreConnector<int, String>(
                builder: (context, value) {
                  return Text(value);
                },
                converter: (s) => s.state.toString(),
              ),
              StoreConnector<int, VoidCallback>(
                builder: (context, cb) {
                  return TextButton(
                    onPressed: cb,
                    child: const Text('Increment'),
                  );
                },
                converter: (s) {
                  return () => s.dispatch(Actions.increment);
                },
              ),
              StoreConnector<int, VoidCallback>(
                builder: (context, cb) {
                  return TextButton(
                    onPressed: cb,
                    child: const Text('Decrement'),
                  );
                },
                converter: (s) {
                  return () => s.dispatch(Actions.decrement);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
