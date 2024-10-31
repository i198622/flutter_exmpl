import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/feed_inner_screen.dart';
import '../screens/feed_screen.dart';
import '../screens/settings_screen.dart';
import '../widgets/app_view.dart';
import '../screens/home_screen.dart';

abstract class AppRoutes {
  static const String home = '/';
  static const String feed = '/feed';
  static const String feedInner = '/inner';
  static const String modal = '/modal';
  static const String profile = '/profile';
  static const String settings = '/settings';
}

final router = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.feed,
              builder: (context, state) => const FeedScreen(),
              routes: [
                GoRoute(
                  path: AppRoutes.feedInner,
                  builder: (context, state) => const FeedInnerScreen(),
                ),

              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return AppView(navigationShell: navigationShell);
      },
    ),
    GoRoute(
      path: AppRoutes.modal,
      pageBuilder: (context, state) => const MaterialPage(
        child: FeedInnerScreen(),
        fullscreenDialog: true,
      ),
    ),
  ],
);
