import 'package:flutter/material.dart';

import 'autoroute/main.dart';
import 'bloc/main.dart';
import 'chat/main.dart';
import 'go_router/main.dart';
import 'modular/main.dart';
import 'navigation/main.dart';
import 'rx/main.dart';
import 'state_managment/main.dart';

void main() {
  // Go router
  // runApp(const EntryWidget());

  // Modular
  // runApp(const ModularEntryWidget());

  // AutoRoute
  // runApp(const AutoRouteEntryWidget());

  // Rx state
  // runApp(rxEntry());

  // Bloc
  // runApp(const BlocEntryWidget());

  // Chat
  // runApp(const EntryChat());

  // Nav
  // runApp(const EntryNavigation());

  // State Management
  runApp(const StateEntry());
}
