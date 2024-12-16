import 'package:flutter/material.dart';

import 'core/router/router.dart';

class AppMainEntry extends StatelessWidget {
  const AppMainEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes(),
    );
  }
}
