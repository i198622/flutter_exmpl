import 'package:flutter/material.dart';

import 'screens/bio_screen.dart';
import 'screens/camera.dart';
import 'screens/image_picker.dart';
import 'screens/images_screen.dart';
import 'screens/info_screen.dart';
import 'screens/qrcode_generator_screen.dart';
import 'screens/quick_actions.dart';
import 'screens/splash_screen.dart';
import 'screens/svg_screen.dart';

class PluginsEntry extends StatelessWidget {
  const PluginsEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: SplashScreen(),
      // home: BioAuthScreen(),
      // home: QuickActionScreen(),
      // home: ImagesScreen(),
      // home: InfoScreen(),
      home: QrCodeGeneratorScreen(),
      // home: CameraScreen(),
      // home: SvgScreen(),
      // home: ImagePickerScreen(),
    );
  }
}
