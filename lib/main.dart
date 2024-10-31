import 'package:flutter/material.dart';

import 'autoroute/main.dart';
import 'go_router/main.dart';
import 'modular/main.dart';
import 'rx/main.dart';

void main() {
  // Go router
  // runApp(const EntryWidget());

  // Modular
  // runApp(const ModularEntryWidget());

  // AutoRoute
  // runApp(const AutoRouteEntryWidget());

  // Rx state
  runApp(rxEntry());
}
