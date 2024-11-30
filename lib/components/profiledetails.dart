import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  final String data;
  final String value;

  const ProfileDetails({super.key, required this.data, required this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextData(
            text: "$data: ",
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: const Color(0xff9d9b9b)),
        TextData(
            text: value,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: const Color(0xff3c3c3c)),
      ],
    );
  }
}
