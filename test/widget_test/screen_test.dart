import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_exmpl/test_target/widgets/sample_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget test example', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SampleScreen(
          title: 'title',
          message: 'message',
        ),
      ),
    );

    final titleFinder = find.text('title');
    final messageFinder = find.text('message');
    final floatingAction = find.byType(FloatingActionButton);
    final counterText = find.byKey(testCounterKey);

    expect(counterText, findsOneWidget);
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
    expect(floatingAction, findsOneWidget);
  });

  testWidgets('Widget test interactions', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SampleScreen(
          title: 'title',
          message: 'message',
        ),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
