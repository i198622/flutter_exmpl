import 'package:flutter/material.dart';

import 'screens/basic.dart';
import 'screens/browser.dart';
import 'screens/launcher.dart';
import 'screens/simple.dart';
import 'screens/tabs.dart';

class WebViewEntry extends StatelessWidget {
  const WebViewEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: WebViewExample(),
      // home: SimpleWebViewScreen(),
      // home: BrowserScreen(),
      // home: TabsBrowser(),
      home: UrlLauncher(),
    );
  }
}
