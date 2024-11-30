import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';

class Mainheading extends StatelessWidget {
  final String text;
  const Mainheading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextData(
        text: text,
        fontSize: 29,
        fontWeight: FontWeight.w600,
        color: const Color(0xff2c2c34));
  }
}
