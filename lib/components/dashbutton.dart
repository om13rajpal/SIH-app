import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget{
  final Color colour;
  final String text;
  const DashboardButton({super.key, required this.colour, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: colour,
                              borderRadius: BorderRadius.circular(10)),
                         child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              textAlign: TextAlign.center,
                              text,
                              style: const TextStyle(
                                  fontSize: 11.5,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff272727)),
                            )),
                          ),
                        );
  }

}