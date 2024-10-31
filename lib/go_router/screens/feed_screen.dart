import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/router.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              context.go(AppRoutes.settings);
            },
            child: const Text('To settings tab'),
          ),
          TextButton(
            onPressed: () {
              context.push('/feed/inner');
            },
            child: const Text('Feed inner'),
          ),
          TextButton(
            onPressed: () {
              context.push('/modal');
            },
            child: const Text('Feed modal'),
          ),
          TextButton(
            onPressed: () {
              context.go(AppRoutes.home);
            },
            child: const Text('Home'),
          )
        ],
      ),
    );
  }
}
