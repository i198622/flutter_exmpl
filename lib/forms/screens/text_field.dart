// Forms
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormsView extends StatefulWidget {
  const FormsView({super.key});

  @override
  State<FormsView> createState() => _FormsViewState();
}

class _FormsViewState extends State<FormsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(label: Text('Your phone')),
              ),
              const SizedBox(
                height: 40,
              ),
              const TextField(
                decoration: const InputDecoration(
                  label: Text('Your password'),
                  error: const Text(
                    'error text',
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              const TextField(
                decoration: InputDecoration(
                  label: Text('Your password'),
                  hintText: 'test hint',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                  label: const Text('Your password'),
                  hintText: 'Enter your passworh here',
                  // floatingLabelAlignment: FloatingLabelAlignment.center,
                  // floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // filled: true,
                  // fillColor: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  label: Text('Textarea'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                // color: Colors.black38,
                padding: const EdgeInsets.all(20),
                child: const CupertinoTextField(
                  placeholder: 'Required',
                  decoration: BoxDecoration(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class FormControls extends StatefulWidget {
//   const FormControls({super.key});
//
//   @override
//   State<FormControls> createState() => _FormControlsState();
// }
//
// class _FormControlsState extends State<FormControls> {
//   final focus = FocusNode();
//   final controller = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     // controller.text = 'initial text';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Forms'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 14),
//         child: Column(
//           children: [
//             TextField(
//               focusNode: focus,
//               decoration: const InputDecoration(
//                   label: Text('Your name')
//               ),
//               controller: controller,
//             ),
//             TextButton(
//               onPressed: () {
//                 focus.unfocus();
//                 controller.clear();
//               },
//               child: const Text('unfocus'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FormsValidation extends StatefulWidget {
//   const FormsValidation({super.key});
//
//   @override
//   State<FormsValidation> createState() => _FormsValidationState();
// }
//
// class _FormsValidationState extends State<FormsValidation> {
//   final _formKey = GlobalKey<FormState>();
//   final Map<String, String> formValues = {
//     'email': '',
//     'password': '',
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Forms'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 14),
//         child: Form(
//           key: _formKey,
//           onChanged: () {
//             print('form changed');
//           },
//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: const InputDecoration(
//                       label: Text('Email'),
//                     ),
//                     initialValue: 'example@acme.com',
//                     onSaved: (v) {
//                       formValues['email'] = v!;
//                     },
//                     validator: (v) {
//                       if (v!.isEmpty || v.length < 10) {
//                         return 'Field is required';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   TextFormField(
//                     decoration: const InputDecoration(label: Text('Password')),
//                     obscureText: true,
//                     onSaved: (v) {
//                       formValues['password'] = v!;
//                     },
//                     validator: (v) {
//                       if (v!.isEmpty || v.length < 10) {
//                         return 'Field is required';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 40,),
//                   ElevatedButton(
//                     onPressed: () {
//                       _formKey.currentState!.save();
//                       if (_formKey.currentState!.validate()) {
//                         print('form valid');
//                         print(formValues);
//                       }
//                     },
//                     child: const Text('Submit'),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }