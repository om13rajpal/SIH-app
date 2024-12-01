import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';

class KeySkills extends StatefulWidget {
  final String head;
  final String content;

  const KeySkills({super.key, required this.head, required this.content});

  @override
  State<KeySkills> createState() => _KeySkillsState();
}

class _KeySkillsState extends State<KeySkills> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: TextData(
          text: widget.head,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xff202020)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color(0xff9CAFB7),
      collapsedTextColor: const Color(0xff535353),
      childrenPadding: const EdgeInsets.all(10),
      textColor: const Color(0xff202020),
      onExpansionChanged: (value) {
        setState(() {
          expanded = value;
        });
      },
      trailing: AnimatedRotation(
        turns: expanded ? -0.125 : 0.0,
        duration: const Duration(milliseconds: 100),
        child: const Icon(Icons.add, size: 18,),
      ),
      children: [
        TextData(
            text: widget.content,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xff202020)),
      ],
    );
  }
}
