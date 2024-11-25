import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String labelText;

  const Input(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.labelText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.045),
          hintStyle: TextStyle(
              color: const Color.fromARGB(97, 19, 19, 19),
              fontSize: MediaQuery.of(context).size.width * 0.042)),
    );
  }
}
