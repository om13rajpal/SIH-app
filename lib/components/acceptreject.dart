import 'package:drdo/components/profiledetails.dart';
import 'package:drdo/components/sectionheading.dart';
import 'package:flutter/material.dart';

class ApplicationSelection extends StatefulWidget {
  final String name;
  final String profilescore;
  final String age;
  final String pronouns;
  final String skill;

  const ApplicationSelection(
      {super.key,
      required this.name,
      required this.profilescore,
      required this.age,
      required this.pronouns,
      required this.skill});

  @override
  State<ApplicationSelection> createState() => _ApplicationSelectionState();
}

class _ApplicationSelectionState extends State<ApplicationSelection> {
  bool accepted = false;
  bool rejected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.grey),
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sectionheading(text: widget.name),
            Row(
              children: [
                ProfileDetails(data: "Profile Score", value: widget.profilescore),
                const SizedBox(
                  width: 6,
                ),
                ProfileDetails(data: "Age", value: widget.age)
              ],
            ),
            Row(
              children: [
                ProfileDetails(data: "Pronouns", value: widget.pronouns),
                const SizedBox(
                  width: 6,
                ),
                ProfileDetails(data: "Skill", value: widget.skill)
              ],
            ),
          ],
        ),
        Checkbox(
          value: accepted,
          onChanged: (bool? value) {
            setState(() {
              accepted = value!;
            });
          },
        ),
        Checkbox(
          value: rejected,
          onChanged: (bool? value) {
            setState(() {
              rejected = value!;
            });
          },
        ),
      ],
    );
  }
}
