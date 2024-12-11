import 'package:drdo/components/acceptreject.dart';
import 'package:drdo/components/background.dart';
import 'package:drdo/components/expertpanel.dart';
import 'package:drdo/components/mainheading.dart';
import 'package:drdo/components/numbers.dart';
import 'package:drdo/components/profiledetails.dart';
import 'package:drdo/components/searchbar.dart';
import 'package:drdo/components/sectionheading.dart';
import 'package:drdo/components/sortnsearch.dart';
import 'package:flutter/material.dart';

class JobApplications extends StatefulWidget {
  const JobApplications({super.key});

  @override
  State<JobApplications> createState() => _JobApplicationsState();
}

class _JobApplicationsState extends State<JobApplications> {
  TextEditingController controller = TextEditingController();
  bool accepted = false;
  bool rejected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
            child: Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.91,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Mainheading(text: "Job Applications"),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Numbers(label: "Total Jobs", value: "11.26 K"),
                    Numbers(label: "Opened", value: "518"),
                    Numbers(label: "Closed", value: "1009"),
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
                const ApplicationSelection(name: "Om Rajpal", profilescore: "82.2", age: "19", pronouns: "He/ Him", skill: "Flutter"),
                const SizedBox(
                  height: 10,
                ),
                const ApplicationSelection(name: "Om Rajpal", profilescore: "82.2", age: "19", pronouns: "He/ Him", skill: "Flutter"),
                const SizedBox(
                  height: 10,
                ),
                const ApplicationSelection(name: "Om Rajpal", profilescore: "82.2", age: "19", pronouns: "He/ Him", skill: "Flutter"),
                const SizedBox(
                  height: 10,
                ),
                const ApplicationSelection(name: "Om Rajpal", profilescore: "82.2", age: "19", pronouns: "He/ Him", skill: "Flutter"),
                const SizedBox(
                  height: 10,
                ),
                const ApplicationSelection(name: "Om Rajpal", profilescore: "82.2", age: "19", pronouns: "He/ Him", skill: "Flutter"),
                const SizedBox(
                  height: 10,
                ),
                const ApplicationSelection(name: "Om Rajpal", profilescore: "82.2", age: "19", pronouns: "He/ Him", skill: "Flutter"),
                const SizedBox(
                  height: 10,
                ),
                const ApplicationSelection(name: "Om Rajpal", profilescore: "82.2", age: "19", pronouns: "He/ Him", skill: "Flutter"),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
