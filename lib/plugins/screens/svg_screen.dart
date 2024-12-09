import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgScreen extends StatelessWidget {
  const SvgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Svg'),
      ),
      body: Column(
        children: [
          SvgPicture.asset(
            'assets/svg/startup_logo.svg',
            width: 200,
          ),

          SvgPicture.network(
            'https://raw.githubusercontent.com/tabler/tabler-icons/refs/heads/main/icons/outline/antenna-off.svg',
            semanticsLabel: 'A shark?!',
            width: 150,
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
            placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
