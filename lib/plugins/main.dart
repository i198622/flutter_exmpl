import 'package:flutter/material.dart';

import 'screens/camera.dart';
import 'screens/svg_screen.dart';

class PluginsEntry extends StatelessWidget {
  const PluginsEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: CameraScreen(),
      home: SvgScreen(),
    );
  }
}
