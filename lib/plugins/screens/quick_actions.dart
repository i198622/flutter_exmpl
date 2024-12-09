import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionScreen extends StatefulWidget {
  const QuickActionScreen({super.key});

  @override
  State<QuickActionScreen> createState() => _QuickActionScreenState();
}

class _QuickActionScreenState extends State<QuickActionScreen> {
  String shortcut = 'no action set';

  @override
  void initState() {
    super.initState();

    const QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
      setState(() {
        shortcut = shortcutType;
      });
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'action_one',
        localizedTitle: 'Action one',
        icon: 'AppIcon',
      ),
      const ShortcutItem(type: 'action_two', localizedTitle: 'Action two', icon: 'ic_launcher'),
    ]).then((void _) {
      setState(() {
        if (shortcut == 'no action set') {
          shortcut = 'actions ready';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shortcut),
      ),
    );
  }
}
