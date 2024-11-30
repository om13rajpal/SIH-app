import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';

class Job extends StatelessWidget{
  final String jobTitle;

  const Job({super.key, required this.jobTitle});
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
                                const TextData(
                                    text: "Applications: 101",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff2b2b2b)),
                                const TextData(
                                    text: "Opened 2 Days Ago",
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff3d3d3d))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
  }

}