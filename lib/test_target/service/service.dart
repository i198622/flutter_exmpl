import 'package:dio/dio.dart';

int sum({ required int a, required int b }) {
  return a + b;
}

class Counter {
  int value = 0;

  void increment() => value++;
  void decrement() => value--;

  Future<int> incrementAsync() async {
    return Future.value(value++);
  }

  Future<int> decrementAsync() async {
    return Future.value(value--);
  }
}



class ApiService {
  final _client = Dio();

  Future<String> getUserName() async {
    try {
      final result = await _client.get('http://example.com/api/users');
      return result.data;
    } catch(e) {
      rethrow;
    }
  }
}