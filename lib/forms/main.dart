import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/check.dart';

import 'screens/select.dart';
import 'screens/text_field.dart';

class EntryForms extends StatelessWidget {
  const EntryForms({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: FormsView(),
      // home: FormsValidation(),
      // home: CheckWidget()
      // home: SelectWidget(),
      home: DatePickerExample(),
    );
  }
}


