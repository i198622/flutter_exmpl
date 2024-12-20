import 'package:flutter/material.dart';

import 'animations/main.dart';
import 'architecture/core/container.dart';
import 'architecture/main.dart';
import 'autoroute/main.dart';
import 'bloc/main.dart';
import 'bloc_events/main.dart';
import 'chat/main.dart';
import 'databases/main.dart';
import 'forms/main.dart';
import 'go_router/main.dart';
import 'mobx/main.dart';
import 'modular/main.dart';
import 'navigation/main.dart';
import 'new_widgets/main.dart';
import 'plugins/main.dart';
import 'plugins/screens/camera.dart';
import 'plugins/screens/splash_screen.dart';
import 'redux/main.dart';
import 'rx/main.dart';
import 'state_managment/main.dart';
import 'test_target/widgets/sample_screen.dart';
import 'webview/entry.dart';

void main() async {
  setupSplash();
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  //
  // await initCameras();

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
  // runApp(const StateEntry());

  // Redux state management
  // runApp(const ReduxEntry());

  // Forms
  // runApp(const EntryForms());
  
  // Animations
  // runApp(const AnimationEntryScreen());

  // runApp(const NewWidgetsEntry());

  // runApp(const DatabaseEntry());
  // runApp(const WebViewEntry());

  // runApp(const PluginsEntry());


  // runApp(MobxEntryScreen());

  // runApp(const BlocEventsEntryWidget());
  runApp(const AppMainEntry());
}
