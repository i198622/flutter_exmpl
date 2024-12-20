import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class SelectWidget extends StatefulWidget {
//   const SelectWidget({super.key});
//
//   @override
//   State<SelectWidget> createState() => _SelectWidgetState();
// }
//
// class _SelectWidgetState extends State<SelectWidget> {
//   final List<String> items = <String>['One', 'Two', 'Three', 'Four'];
//   String dropdownValue = '';
//   String date = '';
//   TimeOfDay _selectedTime = TimeOfDay.now();
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       dropdownValue = items.first;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Select'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             DropdownButton<String>(
//               value: dropdownValue,
//               style: const TextStyle(color: Colors.deepPurple),
//               underline: Container(
//                 height: 2,
//                 color: Colors.deepPurpleAccent,
//               ),
//               onChanged: (String? value) {
//                 setState(() {
//                   dropdownValue = value!;
//                 });
//               },
//               items: items.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             DropdownButtonFormField(
//               items: items.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (v) {},
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextButton(
//               onPressed: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   // initialEntryMode: DatePickerEntryMode.calendar,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                 );
//                 setState(() {
//                   date = pickedDate.toString();
//                 });
//               },
//               child: Text('Select date: ${date}'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 DateTimeRange? pickedDate = await showDateRangePicker(
//                   context: context,
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                 );
//                 print(pickedDate!.start.toString());
//                 print(pickedDate.end.toString());
//               },
//               child: Text('Select date range'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 TimeOfDay? pickedDate = await showTimePicker(
//                   context: context,
//                   initialTime: _selectedTime,
//                 );
//                 print(pickedDate.toString());
//               },
//               child: Text('Select time'),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }


class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoDatePicker Sample'),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _DatePickerItem(
                children: <Widget>[
                  const Text('Date'),
                  CupertinoButton(
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: date,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        showDayOfWeek: true,
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => date = newDate);
                        },
                      ),
                    ),
                    child: Text(
                      '${date.month}-${date.day}-${date.year}',
                      style: const TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
              _DatePickerItem(
                children: <Widget>[
                  const Text('Time'),
                  CupertinoButton(
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: time,
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() => time = newTime);
                        },
                      ),
                    ),
                    child: Text(
                      '${time.hour}:${time.minute}',
                      style: const TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
              _DatePickerItem(
                children: <Widget>[
                  const Text('DateTime'),
                  CupertinoButton(
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: dateTime,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newDateTime) {
                          setState(() => dateTime = newDateTime);
                        },
                      ),
                    ),
                    child: Text(
                      '${dateTime.month}-${dateTime.day}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
                      style: const TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// This class simply decorates a row of widgets.
class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}

