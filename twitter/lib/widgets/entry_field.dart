import 'package:flutter/material.dart';

class CustomEntryField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  const CustomEntryField({
    Key? key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        style: const TextStyle(fontSize: 18.0),
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18.0),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 20.0),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          ),
        ),
      ),
    );
  }
}
