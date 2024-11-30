import 'package:drdo/components/background.dart';
import 'package:drdo/components/job.dart';
import 'package:drdo/components/profiledetails.dart';
import 'package:drdo/components/sectionheading.dart';
import 'package:drdo/components/skillexp.dart';
import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Background(
      colour: Colors.white54,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 165,
              child: Stack(
                children: [
                  Container(
                    color: const Color(0xffD0D0D0),
                    height: 125,
                  ),
                  Positioned(
                    bottom: 0,
                    left: screenWidth * 0.09,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xff6F6F6F),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: screenWidth * 0.81,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextData(
                          text: "Om Rajpal",
                          fontSize: 29,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2c2c34)),
                      const SizedBox(
                        width: 5,
                      ),
                      Transform.translate(
                        offset: const Offset(0, 3.5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: const Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            child: TextData(
                                text: 'Verified',
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676)),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      ProfileDetails(data: "Unit", value: "1st Reconnaissance Squadron"),
                      SizedBox(
                        width: 10,
                      ),
                      ProfileDetails(data: "Age", value: "19")
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Row(
                    children: [
                      ProfileDetails(data: "Pronouns", value: "He / Him"),
                      SizedBox(
                        width: 10,
                      ),
                     ProfileDetails(data: "Experience", value: "Beginner")
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 80,
                    height: 28,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Sectionheading(text: "Top Skills"),
                  const Row(
                    children: [
                      TextData(
                          text: "Key skill",
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff7e7e7e)),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.beach_access,
                        size: 8,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      TextData(
                          text: "Node.js Developer",
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff3c3c3c))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Experience(skill: "Docker", percentage: 0.42),
                  const SizedBox(
                    height: 6,
                  ),
                  const Experience(skill: "Node.js", percentage: 0.17),
                  const SizedBox(
                    height: 6,
                  ),
                  const Experience(skill: "Flutter", percentage: 0.65),
                  const SizedBox(
                    height: 6,
                  ),
                  const Experience(skill: "Next.js", percentage: 0.78),
                  const SizedBox(
                    height: 6,
                  ),
                  const Experience(skill: "Mongo", percentage: 1),
                  const SizedBox(
                    height: 25,
                  ),
                  const Sectionheading(text: "Scheduled Interviews"),
                  const SizedBox(
                    height: 8,
                  ),
                  const Job(jobTitle: "Node.js Developer"),
                  const SizedBox(
                    height: 5,
                  ),
                  const Job(jobTitle: "Node.js Developer"),
                  const SizedBox(
                    height: 5,
                  ),
                  const Job(jobTitle: "Node.js Developer"),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const TextData(
                          text: "3+ more...",
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff7e7e7e)),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          print("View All");
                        },
                        child: const TextData(
                            text: "View All",
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3c3c3c)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Sectionheading(text: "Profile Score"),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 53,
                          lineWidth: 14,
                          percent: 0.7,
                          animateToInitialPercent: true,
                          animationDuration: 1000,
                          progressColor: const Color(0xffDE8F6E),
                          backgroundColor: const Color(0xff2C2C34),
                          animation: true,
                          reverse: true,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        const SizedBox(
                          height: 75,
                          child: VerticalDivider(
                            width: 10,
                            color: Color(0xffCECECE),
                            thickness: 1,
                          ),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextData(
                                text: "80 / 100",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff2C2C34)),
                            SizedBox(
                              height: 13,
                            ),
                            Column(
                              children: [
                                TextData(
                                    text: "Best interviewer for",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff7E7E7E)),
                                TextData(
                                    text: "Flutter Developer",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff3C3C3C))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
