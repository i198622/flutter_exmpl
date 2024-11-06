import 'package:flutter/material.dart';

import 'router/nav2.dart';
import 'screens/main_screen.dart';
import 'screens/second_screen.dart';

class EntryNavigation extends StatelessWidget {
  const EntryNavigation({super.key});
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: MainScreen(),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     routes: {
  //       '/': (_) => const MainScreen(),
  //       '/second': (_) => const SecondScreen(),
  //     },
  //     // home: MainScreen(),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     initialRoute: '/',
  //     onGenerateRoute: (settings) {
  //       if (settings.name == '/') {
  //         return MaterialPageRoute(
  //           builder: (_) => const MainScreen(),
  //         );
  //       }
  //
  //       if (settings.name == '/second') {
  //         return MaterialPageRoute(
  //           builder: (_) => const SecondScreen(),
  //         );
  //       }
  //
  //       return MaterialPageRoute(
  //         builder: (_) => Scaffold()
  //       );
  //     },
  //     // home: MainScreen(),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   final routerDelegate = BookRouterDelegate();
  //   final routeInformationParser = BookRouteInformationParser();
  //   return MaterialApp.router(
  //     title: 'Books App',
  //     routerDelegate: routerDelegate,
  //     routeInformationParser: routeInformationParser,
  //   );
  // }
}