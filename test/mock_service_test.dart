import 'package:flutter_exmpl/test_target/service/service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class ApiServiceMock extends Mock implements ApiService {}

void main() {


  group(
    'Mock service',
    () {
      test('test mock service', () async {
        final apiServiceMock = ApiServiceMock();
        when(() => apiServiceMock.getUserName()).thenAnswer((_) => Future.value('user1'));
        expect(await apiServiceMock.getUserName(), 'user1');
      });

      test('test function sun', () async {
        final apiServiceMock = ApiServiceMock();
        when(() => apiServiceMock.getUserName()).thenAnswer((_) => Future.value('user1'));
        await apiServiceMock.getUserName();
        verify(() => apiServiceMock.getUserName()).called(1);
      });
    },
  );
}
