import 'package:flutter/material.dart';

import 'screens/basic_animations.dart';
import 'screens/widgets_animations.dart';

class AnimationEntryScreen extends StatelessWidget {
  const AnimationEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedTheme(
        data: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        duration: const Duration(milliseconds: 500),
        // child: const BasicAnimations(),
        // child: const BasicTween(),
        // child: const BasicController(),
        // child: const BasicControllerBuilder(),
        // child: const BasicTransitions(),
        // child: const AnimatedSwitcherDemo(),
        // child: const HeroAnimationDemo(),
        child: const AnimatedListDemo(),
      ),
    );
  }
}
