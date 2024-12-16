import 'package:flutter/material.dart';

import '../../../core/container.dart';
import '../../blocs/auth/auth_cubit.dart';

class SecuredScreen extends StatelessWidget {
  const SecuredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = locator.get<AuthCubit>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Secured screen'),
            TextButton(
              onPressed: () {
                authBloc.logout();
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
