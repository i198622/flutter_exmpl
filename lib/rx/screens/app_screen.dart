import 'package:flutter/material.dart';

import '../di.dart';
import '../state/main_state.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = getIt.get<MainController>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder(
          stream: ctrl.counter,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.counter.toString(),
                style: const TextStyle(
                  fontSize: 24,
                ),
              );
            }
            return const Text('');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ctrl.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}