import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SimpleWebViewScreen extends StatefulWidget {
  const SimpleWebViewScreen({super.key});

  @override
  State<SimpleWebViewScreen> createState() => _SimpleWebViewScreenState();
}

class _SimpleWebViewScreenState extends State<SimpleWebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController();

    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onUrlChange: (url) {
          print('url changed');
          print(url);
        },
        onWebResourceError: (e) {
          print('errrrr');
          print(e);
        },
        onPageFinished: (url) {
          print('finished');
        },
      ))
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('webview'),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(
              controller: _controller,
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  _controller
                    ..addJavaScriptChannel(
                      'JSChannel',
                      onMessageReceived: (r) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(r.message),
                          ),
                        );
                      },
                    )
                    ..loadHtmlString(kHtml);
                },
                child: const Text('html'),
              ),
              const SizedBox(width: 10,),
              TextButton(
                onPressed: () async {
                  final res = await _controller.runJavaScriptReturningResult('MyFunc()');
                  print(res.toString());
                },
                child: const Text('run function'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

final kHtml = """
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>
  <button onclick="JSChannel.postMessage('message data');">Info</button>
  
  <script>
    document.addEventListener('message', () => {
      alert("asdasd");
    });
    
    function MyFunc() {
      return "test";
    }
  </script>
</body>
</html>
""";
