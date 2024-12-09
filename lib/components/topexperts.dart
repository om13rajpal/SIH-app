import 'package:drdo/components/text.dart';
import 'package:drdo/profile.dart';
import 'package:flutter/material.dart';

class TopExperts extends StatelessWidget{
  final String name;
  final String job;
  final String score;
  const TopExperts({super.key, required this.name, required this.job, required this.score});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile(id: "675521ca5369beebdc1f58ef", type: '',)));
      },
      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                            color: const Color(0xff838383),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: TextData(
                                text: name,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff232323)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.32,
                        child: TextData(text: job, fontSize: 10, fontWeight: FontWeight.w500, color: const Color(0xff979797))),
                        const SizedBox(
                          width: 10,
                        ),
                      SizedBox(
                        width: 30,
                        child: TextData(
                            text: score,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff232323)),
                      ),
                        ],
                      ),
                      
                    ],
                  ),
    );
  }

}