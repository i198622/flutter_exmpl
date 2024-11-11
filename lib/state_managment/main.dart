import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'inherited/change_notifier.dart';
import 'inherited/value_notifier.dart';
import 'models/counter_model.dart';
import 'stream/stream.dart';

class StateEntry extends StatelessWidget {
  const StateEntry({super.key});

  // Inherited
  // @override
  // Widget build(BuildContext context) {
  //   return InheritedProvider(
  //     notifier: CounterNotifier(
  //       CounterModel(
  //         counter: 1,
  //       ),
  //     ),
  //     child: MaterialApp(
  //       home: Scaffold(
  //         appBar: AppBar(
  //           title: const Text('main'),
  //         ),
  //         body: Builder(
  //           builder: (context) {
  //             return Column(
  //               children: [
  //                 ValueListenableBuilder<CounterModel>(
  //                   valueListenable: InheritedProvider.of(context),
  //                   builder: (context, value, _) {
  //                     return Text(
  //                       value.counter.toString(),
  //                     );
  //                   },
  //                 ),
  //                 TextButton(
  //                   onPressed: () {
  //                     InheritedProvider.of(context).increment();
  //                   },
  //                   child: const Text('Increment'),
  //                 ),
  //               ],
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Provider package
  // @override
  // Widget build(BuildContext context) {
  //
  //   return ChangeNotifierProvider(
  //     create: (_) {
  //       return ExampleCounterNotifier();
  //     },
  //     child: MaterialApp(
  //       home: Scaffold(
  //         appBar: AppBar(
  //           title: const Text('Main'),
  //         ),
  //         body: Builder(
  //           builder: (context) {
  //             return Column(
  //               children: [
  //                 Consumer<ExampleCounterNotifier>(
  //                   builder: (_, value, __) {
  //                     return Text(value.counter.toString());
  //                   },
  //                 ),
  //                 TextButton(
  //                   onPressed: () {
  //                     context.read<ExampleCounterNotifier>().increment();
  //                   },
  //                   child: const Text('increment'),
  //                 )
  //               ],
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final s = CounterService();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Main'),
        ),
        body: Column(
          children: [
            StreamBuilder(
              stream: s.counterStream,
              initialData: 0,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return const Text('initial data');
                }
                return Text(snapshot.data!.toString());
              },
            ),
            TextButton(
              onPressed: () {
                s.increment();
              },
              child: const Text('increment'),
            )
          ],
        ),
      ),
    );
  }
}
