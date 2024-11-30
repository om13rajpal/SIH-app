import 'package:drdo/components/background.dart';
import 'package:drdo/components/mainheading.dart';
import 'package:drdo/components/numbers.dart';
import 'package:drdo/components/sectionheading.dart';
import 'package:drdo/components/text.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        colour: Colors.white54,
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.85,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Mainheading(text: "Dashboard"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Numbers(label: "Candidates", value: "11.26 K"),
                    Numbers(label: "Experts", value: "518"),
                    Numbers(label: "Open Jobs", value: "1009"), 
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                Sectionheading(text: "Top Experts")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
