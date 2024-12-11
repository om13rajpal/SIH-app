import 'package:drdo/components/profiledetails.dart';
import 'package:drdo/components/sectionheading.dart';
import 'package:flutter/material.dart';

class ExpertPanel extends StatefulWidget {
  final String name;
  final String unit;
  final String age;
  final String pronouns;
  final String experience;
  const ExpertPanel(
      {super.key,
      required this.name,
      required this.unit,
      required this.age,
      required this.pronouns,
      required this.experience});

  @override
  State<ExpertPanel> createState() => _ExpertPanelState();
}

class _ExpertPanelState extends State<ExpertPanel> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sectionheading(text: widget.name),
            Row(
              children: [
                ProfileDetails(
                    data: "Unit", value: widget.unit),
                const SizedBox(
                  width: 10,
                ),
                ProfileDetails(data: "Age", value: widget.age)
              ],
            ),
            Row(
              children: [
                ProfileDetails(data: "Pronouns", value: widget.pronouns),
                const SizedBox(
                  width: 10,
                ),
                ProfileDetails(data: "Experience", value: widget.experience)
              ],
            ),
          ],
        ),
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        )
      ],
    );
  }
}
