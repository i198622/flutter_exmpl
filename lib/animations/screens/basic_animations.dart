import 'package:flutter/material.dart';
import 'dart:math' as math;

// https://github.com/flutter/samples/tree/main/animations#animation-samples
class BasicAnimations extends StatefulWidget {
  const BasicAnimations({super.key});

  @override
  State<BasicAnimations> createState() => _BasicAnimationsState();
}

class _BasicAnimationsState extends State<BasicAnimations> {
  Color color = Colors.green;
  double width = 100.0;
  double height = 100.0;
  double radius = 0.0;
  bool first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius),
              ),
              duration: const Duration(milliseconds: 300),
              child: const Center(
                child: Text('animated'),
              ),
            ),
            // AnimatedCrossFade(
            //   duration: const Duration(milliseconds: 300),
            //   firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
            //   secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
            //   crossFadeState: first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            // )
            // const AnimatedOpacity(
            //   opacity: 1.0,
            //   duration: const Duration(milliseconds: 500),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            color = Colors.red;
            width = 250.0;
            height = 250.0;
            radius = 60;
            first = !first;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


class BasicTween extends StatefulWidget {
  const BasicTween({super.key});

  @override
  State<BasicTween> createState() => _BasicTweenState();
}

class _BasicTweenState extends State<BasicTween> {
  double width = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween'),
      ),
      body: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0, end: width),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) {
              return Container(
                width: value,
                height: value,
                color: Colors.red,
                child: child,
              );
            },
            child: const Center(
              child: Text('Hello'),
            ),
          ),
          Slider(
            value: width,
            min: 0.0,
            max: 400.0,
            onChanged: (v) {
              setState(() {
                width = v;
              });
            },
          ),
        ],
      ),
    );
  }
}

class BasicController extends StatefulWidget {
  const BasicController({super.key});

  @override
  State<BasicController> createState() => _BasicControllerState();
}

class _BasicControllerState extends State<BasicController>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late Animation roundAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.yellow,
    ).animate(_controller);
    sizeAnimation = Tween<double>(
      begin: 100.0,
      end: 200.0,
    ).animate(_controller);
    roundAnimation = Tween<double>(
      begin: 0,
      end: 50,
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controller'),
      ),
      body: Center(
        child: Container(
          width: sizeAnimation.value,
          height: sizeAnimation.value,
          decoration: BoxDecoration(
            color: colorAnimation.value,
            borderRadius: BorderRadius.circular(roundAnimation.value),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isCompleted) {
            // _controller.animateBack(0);
            _controller.reverse();
            return;
          }
          _controller.forward();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class BasicControllerBuilder extends StatefulWidget {
  const BasicControllerBuilder({super.key});

  @override
  State<BasicControllerBuilder> createState() => _BasicControllerBuilderState();
}

class _BasicControllerBuilderState extends State<BasicControllerBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 1.0 * math.pi,
              child: child,
            );
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class BasicTransitions extends StatefulWidget {
  const BasicTransitions({super.key});

  @override
  State<BasicTransitions> createState() => _BasicTransitionsState();
}

class _BasicTransitionsState extends State<BasicTransitions>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transitions'),
      ),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}