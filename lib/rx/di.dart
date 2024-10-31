import 'package:get_it/get_it.dart';

import 'state/main_state.dart';

final getIt = GetIt.instance;

setupDi() {
  getIt.registerSingleton<MainController>(MainController());
}