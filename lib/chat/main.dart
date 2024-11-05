import 'package:flutter/material.dart';

import 'theme/colors.dart';
import 'theme/fonts.dart';

final myTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.primaryColor,
  // useMaterial3: true,
  // colorScheme: ColorScheme.highContrastDark(),
);

class EntryChat extends StatelessWidget {
  const EntryChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColumnRowPage(),
      // home: ScaffoldPage(),
      // home: ScaffoldNavPage(),
      // home: ScaffoldDrawerPage(),
      builder: (context, child) {
        final data = MediaQuery.of(context);
        double factor = 1;

        switch(data.size.width) {
          case < 300:
            factor = 2;
          case < 600:
            factor = 3;
        }

        return MediaQuery(
          data: data.copyWith(
            // textScaler: TextScaler.linear(factor),
            textScaler: data.textScaler.clamp(
              minScaleFactor: 1,
              maxScaleFactor: 3,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}

// Column, Rows
// https://docs.flutter.dev/ui/widgets/layout
class ColumnRowPage extends StatelessWidget {
  const ColumnRowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asd'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'First ',
              style: AppFonts.header1.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              'Second',
              style: AppFonts.baseFont,
            ),
          ],
        ),
      ),
      // body: Row(
      //   children: [
      //     Text('First row'),
      //     const SizedBox(width: 20),
      //     Text('Second row'),
      //   ],
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 10),
      //   child: Text('Padding'),
      // ),
      // body: Container(
      //   width: 150,
      //   height: 150,
      //   padding: const EdgeInsets.only(
      //     top: 20,
      //     left: 20,
      //   ),
      //   margin: const EdgeInsets.only(
      //     top: 100,
      //     left: 150,
      //   ),
      //   decoration: BoxDecoration(
      //     color: Colors.red,
      //     borderRadius: BorderRadius.all(Radius.circular(30)),
      //   ),
      //   child: Text('Container'),
      // ),
      // body: Stack(
      //   children: [
      //     Positioned(
      //       child: Container(
      //         height: 150,
      //         width: 150,
      //         color: Colors.red,
      //       ),
      //     ),
      //     Positioned(
      //       left: 20,
      //       top: 20,
      //       child: Container(
      //         height: 150,
      //         width: 150,
      //         color: Colors.blue,
      //       ),
      //     ),
      //     // Positioned(
      //     //   top: 50,
      //     //   left: 120,
      //     //   child: Text('Positioned'),
      //     // )
      //   ],
      // ),
      // body: Center(
      //   child: Text('Center'),
      // ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       flex: 5,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.red,
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

// Scaffold
// class ScaffoldPage extends StatelessWidget {
//   const ScaffoldPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Title'),
//         leading: Row(
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.edit),
//             ),
//           ],
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.edit),
//           ),
//           IconButton(
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (context) {
//                   return Container(
//                     height: 200,
//                     color: Colors.blue,
//                     child: const Center(
//                       child: Text('Bottom Sheet'),
//                     ),
//                   );
//                 },
//               );
//             },
//             icon: const Icon(Icons.add),
//           )
//         ],
//       ),
//       body: const Center(
//         child: Text('Body'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// Scaffold with nav
// class ScaffoldNavPage extends StatefulWidget {
//   const ScaffoldNavPage({super.key});
//
//   @override
//   State<ScaffoldNavPage> createState() => _ScaffoldNavPageState();
// }
//
// class _ScaffoldNavPageState extends State<ScaffoldNavPage> {
//   int selectedIndex = 0;
//
//   onSelectTab(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Title'),
//       ),
//       body: Center(
//         child: IndexedStack(
//           index: selectedIndex,
//           children: const [
//             Text('Home'),
//             Text('Feed'),
//             Text('Profile'),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.feed),
//             label: 'Feed',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: selectedIndex,
//         onTap: onSelectTab,
//       ),
//     );
//   }
// }

// ScaffoldDrawer
// class ScaffoldDrawerPage extends StatefulWidget {
//   const ScaffoldDrawerPage({super.key});
//
//   @override
//   State<ScaffoldDrawerPage> createState() => _ScaffoldDrawerPageState();
// }
//
// class _ScaffoldDrawerPageState extends State<ScaffoldDrawerPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('title'),
//         actions: [
//           // TextButton(
//           //   onPressed: () {
//           //     Scaffold.of(context).openDrawer();
//           //   },
//           //   child: const Text('open drawer'),
//           // ),
//           Builder(
//             builder: (context) {
//               return TextButton(
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//                 child: const Text('open drawer'),
//               );
//             },
//           )
//         ],
//       ),
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const DrawerHeader(
//                 child: Text('Header'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('Close'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
