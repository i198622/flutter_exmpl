import 'package:flutter_modular/flutter_modular.dart';

import '../features/feed/feed_module.dart';
import 'screens/home_screen.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomeScreen());
    r.module('/feed', module: FeedModule());
  }
}