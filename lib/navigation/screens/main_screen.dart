import 'package:flutter/material.dart';

import 'second_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              // final result = await Navigator.of(context).push<int>(
              //   MaterialPageRoute(
              //     builder: (context) => const SecondScreen(),
              //     fullscreenDialog: true,
              //   ),
              // );
              Navigator.of(context).pushNamed('/second');
            },
            child: const Text('to second'),
          )
        ],
      ),
    );
  }
}
