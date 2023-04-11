import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  String hintText = '';

  var myController = TextEditingController();

  var myKeyboard = TextInputType.emailAddress;

  MyTextFormField(
      {required this.myKeyboard,
      required this.hintText,
      required this.myController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
