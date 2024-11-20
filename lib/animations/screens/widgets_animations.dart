import 'dart:math';

import 'package:flutter/material.dart';

Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

Widget generateContainer(int keyCount) => Container(
      key: ValueKey<int>(keyCount),
      height: Random().nextDouble() * 200,
      width: Random().nextDouble() * 200,
      decoration: BoxDecoration(
        color: generateColor(),
        borderRadius: BorderRadius.circular(Random().nextDouble() * 100),
        border: Border.all(
          color: generateColor(),
          width: Random().nextDouble() * 5,
        ),
      ),
    );

class AnimatedSwitcherDemo extends StatefulWidget {
  const AnimatedSwitcherDemo({super.key});

  @override
  State<AnimatedSwitcherDemo> createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  late Widget container;
  late int keyCount;

  @override
  void initState() {
    super.initState();
    keyCount = 0;
    container = generateContainer(keyCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher'),
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: container,
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            container = generateContainer(++keyCount);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HeroAnimationDemo extends StatelessWidget {
  const HeroAnimationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: GestureDetector(
        child: Hero(
          tag: 'hero-page-child',
          child: _createHeroContainer(
            size: 50.0,
            color: Colors.grey.shade300,
          ),
        ),
        onTap: () => Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (context) => const HeroPage(),
          ),
        ),
      ),
    );
  }
}

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: 'hero-page-child',
          child: _createHeroContainer(
            size: 100.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

StatelessWidget _createHeroContainer({
  required double size,
  required Color color,
}) {
  return Container(
    height: size,
    width: size,
    padding: const EdgeInsets.all(10.0),
    margin: size < 100.0 ? const EdgeInsets.all(10.0) : const EdgeInsets.all(0),
    child: const FlutterLogo(),
  );
}

class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({super.key});

  static String routeName = 'misc/animated_list';

  @override
  State<AnimatedListDemo> createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final listData = [
    UserModel(0, 'Govind', 'Dixit'),
    UserModel(1, 'Greta', 'Stoll'),
    UserModel(2, 'Monty', 'Carlo'),
    UserModel(3, 'Petey', 'Cruiser'),
    UserModel(4, 'Barry', 'Cade'),
  ];
  final initialListSize = 5;

  void addUser() {
    setState(() {
      var index = listData.length;
      listData.add(
        UserModel(++_maxIdValue, 'New', 'Person'),
      );
      _listKey.currentState!.insertItem(
        index,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  void deleteUser(int id) {
    setState(
      () {
        final index = listData.indexWhere((u) => u.id == id);
        var user = listData.removeAt(index);
        _listKey.currentState!.removeItem(
          index,
          (context, animation) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: const Interval(0.5, 1.0),
              ),
              child: SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: animation,
                  curve: const Interval(0.0, 1.0),
                ),
                axisAlignment: 0.0,
                child: _buildItem(user),
              ),
            );
          },
          duration: const Duration(milliseconds: 600),
        );
      },
    );
  }

  Widget _buildItem(UserModel user) {
    return ListTile(
      key: ValueKey<UserModel>(user),
      title: Text(user.firstName),
      subtitle: Text(user.lastName),
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => deleteUser(user.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addUser,
          ),
        ],
      ),
      body: SafeArea(
        child: AnimatedList(
          key: _listKey,
          initialItemCount: 5,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: _buildItem(listData[index]),
            );
          },
        ),
      ),
    );
  }
}

class UserModel {
  UserModel(
    this.id,
    this.firstName,
    this.lastName,
  );

  final int id;
  final String firstName;
  final String lastName;
}

int _maxIdValue = 4;
