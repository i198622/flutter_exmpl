import 'package:flutter/material.dart';

import 'screens/basic.dart';
import 'screens/simple.dart';

class WebViewEntry extends StatelessWidget {
  const WebViewEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: WebViewExample(),
      home: SimpleWebViewScreen(),
    );
  }
}
