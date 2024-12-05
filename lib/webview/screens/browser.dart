import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyInAppBrowser extends InAppBrowser {
  MyInAppBrowser({super.webViewEnvironment});

  @override
  Future onBrowserCreated() async {
    print('Browser Created!');
  }

  @override
  Future onLoadStart(url) async {
    print('Started $url');
  }

  @override
  Future onLoadStop(url) async {
    print('Stopped $url');
  }

  @override
  void onReceivedError(WebResourceRequest request, WebResourceError error) {
    print("Can't load ${request.url}.. Error: ${error.description}");
  }

  @override
  void onProgressChanged(progress) {
    print('Progress: $progress');
  }

  @override
  void onExit() {
    print('Browser closed!');
  }
}

class BrowserScreen extends StatefulWidget {
  const BrowserScreen({super.key});

  @override
  State<BrowserScreen> createState() => _MyAppState();
}

class _MyAppState extends State<BrowserScreen> {
  final browser = MyInAppBrowser();

  final settings = InAppBrowserClassSettings(
    browserSettings: InAppBrowserSettings(hideUrlBar: false),
    webViewSettings: InAppWebViewSettings(javaScriptEnabled: true, isInspectable: kDebugMode),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InAppBrowser Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            browser.openUrlRequest(
              urlRequest: URLRequest(url: WebUri('https://flutter.dev')),
              settings: settings,
            );
          },
          child: const Text('Open InAppBrowser'),
        ),
      ),
    );
  }
}
