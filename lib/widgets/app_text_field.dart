import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  // Constructor that receives a controller and a label text for the text field
  const AppTextField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController controller; // The controller for the text field
  final String labelText; // The label text for the text field

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 20,
        right: 20,
      ),
      child: TextField(
        style: const TextStyle(
          color: Colors.cyan,
        ),
        cursorColor: Colors.cyan,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Colors.cyan,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.cyan,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
          labelText: labelText, // The label text for the text field
        ),
      ),
    );
  }
}
