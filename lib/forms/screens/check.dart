import 'package:flutter/material.dart';

class CheckWidget extends StatefulWidget {
  const CheckWidget({super.key});

  @override
  State<CheckWidget> createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
  bool _switchVal = true;
  int _radioSelectedVal = 0;
  final Map<String, bool> _checkBoxVal = {
    'foo': true,
    'bar': false,
  };
  final Map<String, bool> _chipVal = {
    'foo': true,
    'bar': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
      ),
      body: Column(
        children: [
          Switch(
              value: _switchVal,
              onChanged: (v) {
                setState(() {
                  _switchVal = v;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          Radio(
            value: 0,
            groupValue: _radioSelectedVal,
            onChanged: (v) {
              setState(() {
                _radioSelectedVal = v!;
              });
            },
          ),
          Radio(
            value: 1,
            groupValue: _radioSelectedVal,
            onChanged: (v) {
              setState(() {
                _radioSelectedVal = v!;
              });
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CheckboxListTile(
            title: const Text('foo'),
            value: _checkBoxVal['foo'],
            onChanged: (v) {
              setState(() {
                _checkBoxVal['foo'] = v!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('bar'),
            value: _checkBoxVal['bar'],
            onChanged: (v) {
              setState(() {
                _checkBoxVal['bar'] = v!;
              });
            },
          ),
          InputChip(
            label: const Text('Chip 1'),
            onSelected: (v) {
              setState(() {
                _chipVal['foo'] = v;
              });
            },
            onDeleted: () {},
            selected: _chipVal['foo']!,
          ),
          InputChip(
            label: const Text('Chip 1'),
            onSelected: (v) {
              setState(() {
                _chipVal['foo'] = v;
              });
            },
            onDeleted: () {},
            selected: _chipVal['foo']!,
          ),
          FilterChip(
            label: const Text('Filter'),
            onSelected: (v) {},
          ),
          ChoiceChip(
            label: const Text('Choise'),
            selected: true,
            onSelected: (v) {},
          ),
        ],
      ),
    );
  }
}
