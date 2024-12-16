import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/blocs/auth/auth_cubit.dart';
import '../../presentation/blocs/auth/auth_state.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/secured/secured_screen.dart';
import '../container.dart';
import '../utils/stream.dart';

GoRouter routes() {
  final authBloc = locator.get<AuthCubit>();
  return GoRouter(
    initialLocation: '/auth',
    routes: [
      GoRoute(
        path: '/auth',
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/secured',
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SecuredScreen(),
        ),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      if (state.fullPath == '/auth' && authBloc.state.status == AuthenticatedState.authorized) {
        return '/secured';
      }
      if (authBloc.state.status == AuthenticatedState.unauthorized) {
        return '/auth';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
  );
}
