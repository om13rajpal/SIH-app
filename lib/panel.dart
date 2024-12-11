import 'package:drdo/components/background.dart';
import 'package:drdo/components/expertpanel.dart';
import 'package:drdo/components/mainheading.dart';
import 'package:drdo/components/numbers.dart';
import 'package:drdo/components/searchbar.dart';
import 'package:drdo/components/sortnsearch.dart';
import 'package:flutter/material.dart';

class Panel extends StatefulWidget {
  const Panel({super.key});

  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  TextEditingController controller = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
            child: Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Mainheading(text: "Select your panel"),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Numbers(label: "Total Experts", value: "11.26 K"),
                    Numbers(label: "Male", value: "518"),
                    Numbers(label: "Female", value: "1009"),
                  ],
                ),
                const SizedBox(
                  height: 36,
                ),
                SizedBox(height: 32, child: Search(controller: controller)),
                const SizedBox(
                  height: 8,
                ),
                const Sort(),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Color(0xffB8B8B8),
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(
                  height: 15,
                ),
                const ExpertPanel(
                  name: 'Om Rajpal',
                  unit: '1st Reconnaissance Squadron',
                  age: '19',
                  pronouns: 'He / Him',
                  experience: 'Beginner',
                ),
                const SizedBox(
                  height: 12,
                ),
                const ExpertPanel(
                  name: 'Om Rajpal',
                  unit: '1st Reconnaissance Squadron',
                  age: '19',
                  pronouns: 'He / Him',
                  experience: 'Beginner',
                ),
                const SizedBox(
                  height: 12,
                ),
                const ExpertPanel(
                  name: 'Om Rajpal',
                  unit: '1st Reconnaissance Squadron',
                  age: '19',
                  pronouns: 'He / Him',
                  experience: 'Beginner',
                ),
                const SizedBox(
                  height: 12,
                ),
                const ExpertPanel(
                  name: 'Om Rajpal',
                  unit: '1st Reconnaissance Squadron',
                  age: '19',
                  pronouns: 'He / Him',
                  experience: 'Beginner',
                ),
                const SizedBox(
                  height: 12,
                ),
                const ExpertPanel(
                  name: 'Om Rajpal',
                  unit: '1st Reconnaissance Squadron',
                  age: '19',
                  pronouns: 'He / Him',
                  experience: 'Beginner',
                ),
                const SizedBox(
                  height: 12,
                ),
                const ExpertPanel(
                  name: 'Om Rajpal',
                  unit: '1st Reconnaissance Squadron',
                  age: '19',
                  pronouns: 'He / Him',
                  experience: 'Beginner',
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
