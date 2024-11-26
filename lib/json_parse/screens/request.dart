import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:http/retry.dart';

import 'json.dart';

ioClientExample() async {
  var client = HttpClient();
  try {
    HttpClientRequest request = await client.get('localhost', 80, '/file.txt');
    HttpClientResponse response = await request.close();
    final stringData = await response.transform(utf8.decoder).join();
    return jsonDecode(stringData);
  } finally {
    client.close();
  }
}

httpExample() async {
  // var client = http.Client();
  // try {
  //   var response = await client.post(
  //     Uri.https('localhost', '/file'),
  //     headers: {
  //
  //     },
  //     body: {
  //       'name': 'doodle',
  //       'color': 'blue',
  //     },
  //   );
  //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  //   var uri = Uri.parse(decodedResponse['uri'] as String);
  //   print(await client.get(uri));
  // } finally {
  //   client.close();
  // }

  // final client = RetryClient(http.Client());
  // try {
  //   print(await client.get(Uri.http('example.org', '')));
  // } finally {
  //   client.close();
  // }
}

class ApiClient {
  late final Dio _client;

  ApiClient() {
    _client = Dio(BaseOptions(
      baseUrl: 'https://localhost',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 10),
    ));

    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        return handler.next(options.copyWith(headers: {'token': 'asd'}));
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        return handler.next(error);
      },
    ));
  }
}


Future<Model> fullExample() async {
  try {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    return Model.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } catch (e) {
    throw Exception('Failed to load album');
  }
}