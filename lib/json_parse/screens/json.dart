import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:isolate';
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
  final isLoaddedComp = Completer<Bool>();

  // // ///isolateExample()

  final result = await isLoaddedComp.future;
  print(result);
}

dynamic isolateExample() async {
  final jsonStr = await rootBundle.loadString('assets/data.json');
  // final String jsonStr = await rootBundle.loadString('assets/data.json');

  final data = await Isolate.run(() {
    return jsonDecode(jsonStr);
  });

  return data;
}

class Model {
  final String title;
  final String subtitle;
  final Model2 model2;

  Model({
    required this.title,
    required this.subtitle,
    required this.model2,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json['title'],
      subtitle: json['subtitle'],
      model2: Model2.fromJson(json['model2']),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'model2': model2.toJson(),
    };
  }
}

class Model2 {
  final String title;
  final String subtitle;

  Model2({
    required this.title,
    required this.subtitle,
  });

  factory Model2.fromJson(Map<String, dynamic> json) {
    return Model2(
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }
}