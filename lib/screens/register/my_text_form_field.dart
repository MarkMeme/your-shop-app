import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  String hintText = '';

  var myController = TextEditingController();

  var myKeyboard = TextInputType.emailAddress;

  String validatedMessage = '';

  MyTextFormField({
    required this.myKeyboard,
    required this.hintText,
    required this.myController,
    required this.validatedMessage,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (text == null || text.trim().isEmpty) {
          return validatedMessage;
        } else {
          return null;
        }
      },
      keyboardType: myKeyboard,
      controller: myController,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white12)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black)),
      ),
    );
  }
}
