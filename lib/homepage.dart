import 'package:drdo/components/background.dart';
import 'package:drdo/components/dashbutton.dart';
import 'package:drdo/components/job.dart';
import 'package:drdo/components/mainheading.dart';
import 'package:drdo/components/numbers.dart';
import 'package:drdo/components/sectionheading.dart';
import 'package:drdo/components/text.dart';
import 'package:drdo/components/topexperts.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        colour: Colors.white54,
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Mainheading(text: "Dashboard"),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Numbers(label: "Candidates", value: "11.26 K"),
                    Numbers(label: "Experts", value: "518"),
                    Numbers(label: "Open Jobs", value: "1009"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Sectionheading(text: "Top Experts"),
                const SizedBox(
                  height: 10,
                ),
                const TopExperts(
                    name: "Om Rajpal", job: "Flutter Developer", score: "85.5"),
                const SizedBox(
                  height: 7,
                ),
                const TopExperts(
                    name: "Jasvin", job: "Node.js Developer", score: "91.4"),
                const SizedBox(
                  height: 7,
                ),
                const TopExperts(
                    name: "Abcd", job: "Docker Developer", score: "42.1"),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    print("view more");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextData(
                          text: "View more",
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff7E7E7E)),
                      const SizedBox(
                        width: 3,
                      ),
                      Transform.translate(
                          offset: const Offset(0, 1),
                          child: const TextData(
                              text: ">",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 100, 100, 100))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Sectionheading(text: "Control Center"),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DashboardButton(
                        colour: Color(0xffDE8F6E), text: "View all\nexperts"),
                    DashboardButton(
                        colour: Color(0xff9CAFB7), text: "View all\njobs"),
                    DashboardButton(
                        colour: Color(0xff73A7A0),
                        text: "View all\ncandidates"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Sectionheading(text: "Recent Job Openings"),
                const SizedBox(
                  height: 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Job(jobTitle: "Node.js Developer"),
                    const SizedBox(
                      height: 7,
                    ),
                    const Job(jobTitle: "Flutter Developer"),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        print("view more");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextData(
                              text: "Search more",
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff7E7E7E)),
                          const SizedBox(
                            width: 3,
                          ),
                          Transform.translate(
                              offset: const Offset(0, 1),
                              child: const TextData(
                                  text: ">",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 100, 100, 100))),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
