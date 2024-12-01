import 'package:drdo/components/background.dart';
import 'package:drdo/components/job.dart';
import 'package:drdo/components/mainheading.dart';
import 'package:drdo/components/numbers.dart';
import 'package:drdo/components/searchbar.dart';
import 'package:drdo/components/sectionheading.dart';
import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';

class JobList extends StatelessWidget {
  const JobList({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Background(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Mainheading(text: "Jobs"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Numbers(label: "All Jobs", value: "11.26 K"),
                      Numbers(label: "Opened", value: "518"),
                      Numbers(label: "Closed", value: "1009"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Sectionheading(text: "Recent Job Openings"),
                  const SizedBox(
                    height: 8,
                  ),
                  const Job(jobTitle: "Node.js Developer"),
                  const SizedBox(
                    height: 8,
                  ),
                  const Job(jobTitle: "Node.js Developer"),
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
                    height: 14,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 35,
                        width: 110,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffDE8F6E),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: const Text(
                            "Close a Job",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 35,
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: const Text(
                            "New Job",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 32,
                    child: Search(controller: controller)
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      // drop down here
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Sectionheading(text: "All Jobs"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Job(jobTitle: "Node.js Developer"),
                  const SizedBox(
                    height: 8,
                  ),
                  const Job(jobTitle: "Node.js Developer"),
                  const SizedBox(
                    height: 8,
                  ),
                  const Job(jobTitle: "Node.js Developer"),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
