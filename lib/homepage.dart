import 'package:drdo/components/background.dart';
import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Background(
            colour: Colors.white54,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.18,
                  width: screenWidth * 0.85,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextData(
                                text: "Hey Om!",
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                            TextData(
                                text: "Welcome back,",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black45),
                          ],
                        ),
                        Divider(
                          indent: 25,
                          color: Color.fromARGB(255, 126, 126, 126),
                          thickness: 1,
                          endIndent: 25,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.60,
                  width: screenWidth * 0.85,
                ),
                SizedBox(
                  height: screenHeight * 0.20,
                )
              ],
            )),
      ),
    );
  }
}
