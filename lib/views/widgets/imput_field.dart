import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isObsure = false,
    required this.vlaidator,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final bool isObsure;
  final String? Function(String?)? vlaidator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsure,
      validator: vlaidator,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 3),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 3),
          ),
          filled: true,
          hintStyle: const TextStyle(color: Colors.greenAccent),
          fillColor: Colors.blue),
    );
  }
}
