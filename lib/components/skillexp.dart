import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Experience extends StatelessWidget{
  final String skill;
  final int percentage;
  const Experience({super.key, required this.skill, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextData(
                          text: skill,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff3e3e3e)),
                      SizedBox(
                        height: 4.5,
                        child: LinearPercentIndicator(
                          width: 185,
                          lineHeight: 17,
                          padding: const EdgeInsets.only(left: 5),
                          animation: true,
                          animationDuration: 1000,
                          progressColor: const Color(0xff3C3C3C),
                          percent: percentage.toDouble() / 5,
                          barRadius: const Radius.circular(10),
                          backgroundColor: const Color(0xFFA8A8A8),
                        ),
                      )
                    ],
                  );
  }

}