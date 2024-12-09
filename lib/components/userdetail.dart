import 'package:drdo/components/text.dart';
import 'package:drdo/profile.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UserDetail extends StatelessWidget {
  final String name;
  final String age;
  final String work;
  final double percent;
  final String id;
  final String type;
  const UserDetail(
      {super.key,
      required this.name,
      required this.age,
      required this.work,
      required this.percent,
      required this.id, required this.type});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Profile(
                      id: id, type: type,
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.81,
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xff9CAFB7),
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
                        text: name,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff202020)),
                    Row(
                      children: [
                        const TextData(
                            text: "Age: ",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff2b2b2b)),
                        const SizedBox(
                          width: 5,
                        ),
                        TextData(
                            text: age,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff2b2b2b)),
                      ],
                    ),
                    TextData(
                        text: work,
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff3d3d3d))
                  ],
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              CircularPercentIndicator(
                radius: 26,
                lineWidth: 8,
                percent: percent,
                animateToInitialPercent: true,
                center: TextData(
                    text: (percent * 100).toString(),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff202020)),
                animationDuration: 1000,
                progressColor: const Color(0xffDE8F6E),
                backgroundColor: const Color(0xff2C2C34),
                animation: true,
                reverse: true,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
