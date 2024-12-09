import 'package:drdo/components/text.dart';
import 'package:drdo/jobdescription.dart';
import 'package:flutter/material.dart';

class Job extends StatelessWidget {
  final String jobTitle;
  final int daysLeft;
  final int applicants;
  final String id;

  const Job(
      {super.key,
      required this.jobTitle,
      required this.daysLeft,
      required this.applicants,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => JobDescription(
                      id: id,
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.81,
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xff8EB7A8),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 53,
                height: 53,
                decoration: BoxDecoration(
                  color: const Color(0xffE8E8E8),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextData(
                        text: jobTitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff202020)),
                    TextData(
                        text: "Applications: $applicants",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2b2b2b)),
                    TextData(
                        text: "Opened $daysLeft Days Ago",
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff3d3d3d))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
