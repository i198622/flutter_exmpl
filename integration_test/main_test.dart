import 'package:flutter/material.dart';
import 'package:flutter_exmpl/test_target/e2e/screen_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('floating action button tap test', (tester) async {
      await tester.pumpWidget(const E2ETestScreen());

      expect(find.text('0'), findsOneWidget);

      final fab = find.byKey(const ValueKey('increment'));
      await tester.tap(fab);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });
  });
}
