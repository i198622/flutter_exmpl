import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/main_repository.dart';
import '../state/main_bloc.dart';
import '../state/main_events.dart';
import '../state/main_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(
        repository: context.read<MainRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main screen'),
        ),
        body: Builder(
          builder: (context) {
            final state = context.watch<MainBloc>().state;
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
                if (state.state == AuthenticationState.authenticated) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('User authenticated'),
                        TextButton(
                          onPressed: () {
                            context.read<MainBloc>().add(AuthLogoutEvent());
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.read<MainBloc>().add(AuthLoginEvent());
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
