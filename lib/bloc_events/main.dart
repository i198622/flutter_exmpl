import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home_screen.dart';
import 'repository/main_repository.dart';

class BlocEventsEntryWidget extends StatelessWidget {
  const BlocEventsEntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => MainRepository()),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
