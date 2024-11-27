import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedExampleScreen extends StatefulWidget {
  const SharedExampleScreen({super.key});

  @override
  State<SharedExampleScreen> createState() => _SharedExampleScreenState();
}

class _SharedExampleScreenState extends State<SharedExampleScreen> {
  late final SharedPreferences instance;

  String text = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    instance = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shared'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              instance.setString('test', 'test value');
            },
            child: const Text('write'),
          ),
          TextButton(
            onPressed: () async {
              await instance.reload();
              final result = instance.getString('test');
              setState(() {
                text = result ?? '';
              });
            },
            child: const Text('Read'),
          ),
          Text(text),
        ],
      ),
    );
  }
}
