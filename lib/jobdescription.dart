import 'dart:convert';
import 'package:drdo/components/background.dart';
import 'package:drdo/components/keyskills.dart';
import 'package:drdo/components/sectionheading.dart';
import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JobDescription extends StatefulWidget {
  final String id;
  const JobDescription({super.key, required this.id});

  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var response = await http.get(
        Uri.parse(
            "https://api.black-swan.tech/subject/${widget.id}/?applications=true&candidates=true&experts=true&feedbacks=true"),
        headers: {
          "authorization": "Bearer $token",
          "ismobile": "true",
          "Content-Type": "application/json"
        });

    var jsonRes = await jsonDecode(response.body);
    print(jsonRes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.85,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const TextData(
                      text: "Node.js Developer",
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2c2c34)),
                  const SizedBox(
                    height: 2,
                  ),
                  const TextData(
                      text: "(100+ Applications)",
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff646464)),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Color(0xffB5B5B5),
                    endIndent: 14,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Sectionheading(text: "Job Summary"),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextData(
                      text:
                          "As a Node.js Developer, I am passionate about creating efficient, scalable, and robust server-side applications. I specialize in building RESTful APIs, microservices, and real-time solutions using Node.js, ensuring seamless integration with front-end applications and databases.",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff3f3f3f)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Color(0xffB5B5B5),
                    endIndent: 14,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Sectionheading(text: "Key Skills"),
                  const SizedBox(
                    height: 7,
                  ),
                  const KeySkills(
                      head: "Core Development",
                      content:
                          "• Strong experience with MongoDB, including CRUD operations, aggregation pipelines, and schema design.\n• Familiarity with relational databases (e.g., MySQL, PostgreSQL)."),
                  const KeySkills(
                      head: "Database Management",
                      content:
                          "• Strong experience with MongoDB, including CRUD operations, aggregation pipelines, and schema design.\n• Familiarity with relational databases (e.g., MySQL, PostgreSQL)."),
                  const KeySkills(
                      head: "Devops",
                      content:
                          "• Strong experience with MongoDB, including CRUD operations, aggregation pipelines, and schema design.\n• Familiarity with relational databases (e.g., MySQL, PostgreSQL)."),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 30,
                    width: 110,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: const Text(
                        "Edit Job Details",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Sectionheading(text: "Experts"),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    crossAxisCount: 10,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1 / 1,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(2),
                    children: List.generate(17, (index) {
                      return const CircleAvatar(
                        backgroundColor: Color(0xff9CAFB7),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Sectionheading(text: "Candidates"),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    crossAxisCount: 10,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1 / 1,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(2),
                    children: List.generate(27, (index) {
                      return const CircleAvatar(
                        backgroundColor: Color(0xff9CAFB7),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
