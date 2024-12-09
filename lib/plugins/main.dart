import 'package:flutter/material.dart';

import 'screens/bio_screen.dart';
import 'screens/camera.dart';
import 'screens/image_picker.dart';
import 'screens/quick_actions.dart';
import 'screens/svg_screen.dart';

class PluginsEntry extends StatelessWidget {
  const PluginsEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: BioAuthScreen(),
      home: QuickActionScreen(),
      // home: CameraScreen(),
      // home: SvgScreen(),
      // home: ImagePickerScreen(),
    );
  }
}
