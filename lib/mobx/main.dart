import 'package:flutter/material.dart';

import 'screens/main_screen.dart';
import 'state/counter.dart';

final counter = Counter();

class MobxEntryScreen extends StatelessWidget {
  const MobxEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
