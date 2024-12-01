import 'package:drdo/components/background.dart';
import 'package:drdo/components/mainheading.dart';
import 'package:drdo/components/numbers.dart';
import 'package:drdo/components/searchbar.dart';
import 'package:drdo/components/sectionheading.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

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
              const Mainheading(text: "Experts"),
              const SizedBox(
                height: 20,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Numbers(label: "All Experts", value: "11.26 K"),
                  Numbers(label: "Male", value: "518"),
                  Numbers(label: "Female", value: "1009"),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              SizedBox(height: 32, child: Search(controller: controller)),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  // drop down here
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Color(0xffB8B8B8),
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 15,
              ),
              const Sectionheading(text: "All Candidates"),
              const SizedBox(
                height: 8,
              ),
              // list of users here
            ],
          ),
        ),
      ),
    )));
  }
}
