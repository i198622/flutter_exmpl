import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../repository/feed_repository.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Modular.get<FeedRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed screen'),
      ),
      body: Text(repository.getName()),
    );
  }
}
