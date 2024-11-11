import 'package:flutter/material.dart';

import 'inherited/value_notifier.dart';
import 'models/counter_model.dart';

class StateEntry extends StatelessWidget {
  const StateEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedProvider(
      notifier: CounterNotifier(
        CounterModel(
          counter: 1,
        ),
      ),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('main'),
          ),
          body: Builder(
            builder: (context) {
              return Column(
                children: [
                  ValueListenableBuilder<CounterModel>(
                    valueListenable: InheritedProvider.of(context),
                    builder: (context, value, _) {
                      return Text(
                        value.counter.toString(),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      InheritedProvider.of(context).increment();
                    },
                    child: const Text('Increment'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
