import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;

  const CommonTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,hintStyle: TextStyle(color: Colors.grey.shade400),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
