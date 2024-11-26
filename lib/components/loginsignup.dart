import 'package:drdo/components/text.dart';
import 'package:drdo/login.dart';
import 'package:drdo/register.dart';
import 'package:flutter/material.dart';

class LoginSignup extends StatelessWidget {
  final String text;
  final String question;

  const LoginSignup({super.key, required this.text, required this.question});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextData(
            text: question,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black38),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              (text == "Login")
                  ? Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Login()))
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ));
            },
            child: TextData(
                text: text,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black))
      ],
    );
  }
}
