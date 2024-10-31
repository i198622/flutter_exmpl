import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AppView({
    super.key,
    required this.navigationShell,
  });

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateTextStyle.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(color: Theme.of(context).colorScheme.primary);
              }
              return TextStyle(color: Theme.of(context).colorScheme.tertiary);
            },
          ),
        ),
        child: NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: _goBranch,
          destinations: [
            _menuItem(
              context,
              index: 0,
              currentIndex: widget.navigationShell.currentIndex,
              icon: Icons.feed,
              label: 'Feed',
            ),
            _menuItem(
              context,
              index: 1,
              currentIndex: widget.navigationShell.currentIndex,
              icon: Icons.settings,
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required String label,
    required IconData icon,
  }) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: currentIndex == index
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary,
      ),
      label: label,
    );
  }
}
