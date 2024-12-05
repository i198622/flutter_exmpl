import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher extends StatelessWidget {
  const UrlLauncher({super.key});

  Future<void> _launchUrl({required Uri url}) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('launcher'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _launchUrl(url: Uri.parse('https://flutter.dev'));
            },
            child: const Text('browser'),
          ),
          ElevatedButton(
            onPressed: () {
              _launchUrl(url: Uri.parse('tel:+1-555-010-999'));
            },
            child: const Text('phone'),
          ),
          ElevatedButton(
            onPressed: () {
              _launchUrl(url: Uri.parse('sms:5550101234'));
            },
            child: const Text('sms'),
          ),
          ElevatedButton(
            onPressed: () {
              _launchUrl(url: Uri.parse('mailto:example@gmail.com'));
            },
            child: const Text('email'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (!await launchUrl(
                Uri.parse('https://pdfobject.com/pdf/sample.pdf'),
                mode: LaunchMode.externalNonBrowserApplication,
              )) {
                throw Exception('Could not launch');
              }
            },
            child: const Text('file'),
          )
        ],
      ),
    );
  }
}
