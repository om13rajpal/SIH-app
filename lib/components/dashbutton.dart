import 'package:drdo/joblist.dart';
import 'package:drdo/profile.dart';
import 'package:drdo/userlist.dart';
import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  final Color colour;
  final String text;
  final String page;
  const DashboardButton(
      {super.key,
      required this.colour,
      required this.text,
      required this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (page == "experts") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UserList()));
        } else if (page == "candidates") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UserList()));
        } else if (page == "profile") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Profile(name: 'Sneha Kapoor',)));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const JobList()));
        }
      },
      child: Container(
        height: 48,
        width: MediaQuery.of(context).size.width * 0.42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
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
      ),
    );
  }
}
