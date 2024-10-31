import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/main_repository.dart';
import '../state/main_cubit.dart';
import '../state/main_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(
        repository: context.read<MainRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main screen'),
        ),
        body: Builder(
          builder: (context) {
            final state = context.watch<MainCubit>().state;
            switch (state.loading) {
              case ContentState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ContentState.error:
                return const Center(
                  child: Text('error'),
                );
              case ContentState.idle:
              case ContentState.success:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.read<MainCubit>().sendRequest();
                      },
                      child: const Text('Create request'),
                    ),
                    if (state.result != '')
                      Text('result: ${state.result}'),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
