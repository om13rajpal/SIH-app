import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';

class Numbers extends StatelessWidget {
  final String label;
  final String value;

  const Numbers({super.key, required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextData(
            text: label,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: const Color(0xff838383)),
        Transform.translate(
          offset: const Offset(0, -3),
          child: const SizedBox(
            width: 85,
            child: Divider(
              color: Color(0xff838383),
              thickness: 1,
              endIndent: 10,
            ),
          ),
        ),
        Transform.translate(
            offset: const Offset(0, -4),
            child: TextData(
                text: value,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xff2C2C34)))
      ],
    );
  }
}
