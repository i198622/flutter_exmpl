import 'package:flutter/material.dart';

import 'screens/camera.dart';

class PluginsEntry extends StatelessWidget {
  const PluginsEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraScreen(),
    );
  }
}
