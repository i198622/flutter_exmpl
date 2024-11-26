import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseWidgetsScreen extends StatefulWidget {
  const BaseWidgetsScreen({super.key});

  @override
  State<BaseWidgetsScreen> createState() => _BaseWidgetsScreenState();
}

class _BaseWidgetsScreenState extends State<BaseWidgetsScreen> {
  Set<String> selected = {'Inbox'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SegmentedButton(
              multiSelectionEnabled: true,
              onSelectionChanged: (v) {
                setState(() {
                  selected = v;
                });
              },
              segments: const [
                ButtonSegment<String>(
                  value: 'Inbox',
                  label: Text('Inbox'),
                  icon: Icon(Icons.inbox),
                ),
                ButtonSegment<String>(
                  value: 'Outbox',
                  label: Text('Outbox'),
                  icon: Icon(Icons.outbond),
                ),
                ButtonSegment<String>(
                  value: 'Profile',
                  label: Text('Profile'),
                  icon: Icon(Icons.person),
                ),
              ],
              selected: selected,
            ),
          ],
        ),
      ),
    );
  }
}

class DismissibleExample extends StatefulWidget {
  const DismissibleExample({super.key});

  @override
  State<DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              color: Colors.green,
            ),
            key: ValueKey<int>(items[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: ListTile(
              title: Text(
                'Item ${items[index]}',
              ),
            ),
          );
        },
      ),
    );
  }
}

class ElevatedScreen extends StatefulWidget {
  const ElevatedScreen({super.key});

  @override
  State<ElevatedScreen> createState() => _ElevatedScreenState();
}

class _ElevatedScreenState extends State<ElevatedScreen> {
  final ctrl = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              ctrl.toggle();
            },
            child: OverlayPortal(
              controller: ctrl,
              overlayChildBuilder: (context) {
                return Positioned(
                  left: 120,
                  top: 0,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                );
              },
              child: const Text('Hit me'),
            ),
          ),
        ],
      ),
    );
  }
}

class OverlayScreen extends StatelessWidget {
  const OverlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showOverlay(context);
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }

  void showOverlay(BuildContext context) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: MediaQuery.of(context).size.width * 0.2,
        child: Material(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.black12,
            child: const Center(
              child: Text(
                'This is a pop-up dialog',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}

class DraggableScreen extends StatefulWidget {
  const DraggableScreen({super.key});

  @override
  State<DraggableScreen> createState() => _DraggableScreenState();
}

class _DraggableScreenState extends State<DraggableScreen> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Draggable<int>(
            data: 10,
            feedback: Container(
              color: Colors.deepOrange,
              height: 100,
              width: 100,
              child: const Icon(Icons.directions_run),
            ),
            childWhenDragging: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.pinkAccent,
              child: const Center(
                child: Text('Child When Dragging'),
              ),
            ),
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.lightGreenAccent,
              child: const Center(
                child: Text('Draggable'),
              ),
            ),
          ),
          DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(
                height: 100.0,
                width: 100.0,
                color: Colors.cyan,
                child: Center(
                  child: Text('Value is updated to: $acceptedData'),
                ),
              );
            },
            onAcceptWithDetails: (DragTargetDetails<int> details) {
              setState(() {
                acceptedData += details.data;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CallbackShortcutsExample extends StatefulWidget {
  const CallbackShortcutsExample({super.key});

  @override
  State<CallbackShortcutsExample> createState() =>
      _CallbackShortcutsExampleState();
}

class _CallbackShortcutsExampleState extends State<CallbackShortcutsExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CallbackShortcuts(
        bindings: <ShortcutActivator, VoidCallback>{
          const SingleActivator(LogicalKeyboardKey.arrowUp): () {
            setState(() => count = count + 1);
          },
          const SingleActivator(LogicalKeyboardKey.arrowDown): () {
            setState(() => count = count - 1);
          },
        },
        child: Focus(
          autofocus: true,
          child: Column(
            children: <Widget>[
              const Text('Press the up arrow key to add to the counter'),
              const Text(
                  'Press the down arrow key to subtract from the counter'),
              Text('count: $count'),
            ],
          ),
        ),
      ),
    );
  }
}

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  static const int numItems = 20;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table data'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Number'),
            ),
            DataColumn(
              label: Text('Action'),
            ),
          ],
          rows: List<DataRow>.generate(
            numItems,
            (int index) => DataRow(
              color: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.08);
                  }
                  if (index.isEven) {
                    return Colors.grey.withOpacity(0.3);
                  }
                  return null;
                },
              ),
              cells: <DataCell>[
                DataCell(Text('Row $index')),
                DataCell(Text('Row $index')),
              ],
              selected: selected[index],
              onSelectChanged: (bool? value) {
                setState(() {
                  selected[index] = value!;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class GradientScreen extends StatefulWidget {
  const GradientScreen({super.key});

  @override
  State<GradientScreen> createState() => _GradientScreenState();
}

class _GradientScreenState extends State<GradientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: const Center(
          child: Text(
            'Gradient',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ListWheelExampleScreen extends StatefulWidget {
  const ListWheelExampleScreen({super.key});

  @override
  State<ListWheelExampleScreen> createState() => _ListWheelExampleScreenState();
}

class _ListWheelExampleScreenState extends State<ListWheelExampleScreen> {
  final List<Widget> items = List.generate(
    50,
    (i) => ElevatedButton(
      onPressed: null,
      child: Text(
        'Item $i',
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListWheelScrollView(
        itemExtent: 180,
        overAndUnderCenterOpacity: 0.7,
        squeeze: 1.0,
        children: items,
      ),
    );
  }
}

class InteractiveExample extends StatefulWidget {
  const InteractiveExample({super.key});

  @override
  State<InteractiveExample> createState() => _InteractiveExampleState();
}

class _InteractiveExampleState extends State<InteractiveExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        child: Image.network(
          'https://images.unsplash.com/photo-1731329891228-c5009dc54fb6?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ),
    );
  }
}

class RefreshIndicatorExample extends StatefulWidget {
  const RefreshIndicatorExample({super.key});

  @override
  State<RefreshIndicatorExample> createState() =>
      _RefreshIndicatorExampleState();
}

class _RefreshIndicatorExampleState extends State<RefreshIndicatorExample> {
  List<String> items = List.generate(80, (index) => 'Item ${index + 1}');

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      items = List.generate(20, (index) => 'New Item ${index + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator Sample'),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: _refreshData,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key});

  @override
  State<ReorderableExample> createState() => _ReorderableListViewExampleState();
}

class _ReorderableListViewExampleState extends State<ReorderableExample> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      appBar: AppBar(),
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children: <Widget>[
          for (int index = 0; index < _items.length; index += 1)
            ListTile(
              key: Key('$index'),
              tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
              title: Text('Item ${_items[index]}'),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
