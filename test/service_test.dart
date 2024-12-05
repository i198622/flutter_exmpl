import 'package:flutter_exmpl/test_target/service/service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

// https://pub.dev/packages/test
void main() {
  // setUpAll(() {
  //   print('set up all');
  // });
  //
  // setUp(() {
  //   print('setup');
  // });
  //
  // tearDown(() {
  //   print('tear down');
  // });
  //
  // tearDownAll(() {
  //   print('tear down all');
  // });

  group(
    'Test group',
    () {
      test('test function sun', () {
        final result = sum(a: 2, b: 2);
        expect(result, 4);
      }, tags: ['counter']);

      test(
        'Test increment',
        () {
          final counter = Counter();
          counter.increment();

          expect(counter.value, 1);
        },
        tags: ['counter']
      );

      // test('Test async increment', () async {
      //   final counter = Counter();
      //   await counter.incrementAsync();
      //   expect(counter.value, 1);
      // });
      //
      // test(
      //   'Test decrement',
      //   () {
      //     final counter = Counter();
      //     counter.increment();
      //     counter.decrement();
      //     expect(counter.value, 0);
      //   },
      //   tags: ['counter'],
      // );
    },
    // skip: 'This test is skipped',
  );
}
