import 'package:flutter/material.dart';
import 'di.dart';
import 'screens/app_screen.dart';

Widget rxEntry() {
  setupDi();
  return const MaterialApp(
    home: AppScreen(),
  );
}