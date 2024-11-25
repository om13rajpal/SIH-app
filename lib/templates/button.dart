import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;

  const Button({super.key, required this.onPressed, required this.text, required this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Text(
          text,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045, color: Colors.white),
        ),
      ),
    );
  }
}
