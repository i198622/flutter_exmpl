import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

multipleFuture() async {
  final result = Future.wait([
    Future.delayed(const Duration(seconds: 2)),
    Future.delayed(const Duration(seconds: 5)),
    Future.delayed(const Duration(seconds: 8)),
  ]);

  return result;
}

completer() async {
  final comp = Completer<Bool>();
  final result = await comp.future;
  print(result);
}

dynamic isolateExample() async {
  final String jsonStr = await rootBundle.loadString('assets/data.json');

  // final data = await Isolate.run(() {
  //   return jsonDecode(jsonStr);
  // });

  return jsonDecode(jsonStr);
}

class Model {
  final String title;
  final String subtitle;

  Model({
    required this.title,
    required this.subtitle,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }

  Map<dynamic, dynamic> toJson(Map<String, dynamic> json) {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }
}


class ApiClient {
  late final Dio _client;

  ApiClient() {
    _client = Dio(BaseOptions(
      baseUrl: 'https://localhost',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 10),
    ));

    // _client.interceptors.add(InterceptorsWrapper(
    //   onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    //     return handler.next(options);
    //   },
    //   onResponse: (Response response, ResponseInterceptorHandler handler) {
    //     return handler.next(response);
    //   },
    //   onError: (DioException error, ErrorInterceptorHandler handler) {
    //     return handler.next(error);
    //   },
    // ));
  }
}