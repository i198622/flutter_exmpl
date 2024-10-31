import 'package:flutter_modular/flutter_modular.dart';

import 'repository/feed_repository.dart';
import 'screens/feed_screen.dart';

class FeedModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(FeedRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const FeedScreen());
  }
}