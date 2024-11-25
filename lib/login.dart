import 'package:drdo/templates/background.dart';
import 'package:drdo/templates/button.dart';
import 'package:drdo/templates/text.dart';
import 'package:drdo/templates/input.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Background(
      colour: Colors.white54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.15,
            child: Center(
                child: TextData(
              text: "DRDO RAC",
              fontSize: screenWidth * 0.08,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
          ),
          SizedBox(
            height: screenHeight * 0.70,
            width: screenWidth * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextData(
                  text: "Login",
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w600,
                  color: Colors.black38,
                ),
                Input(
                    controller: emailController,
                    hintText: "Eg: omrajpal.exe@gmail.com",
                    obscureText: false,
                    labelText: "Email"),
                Input(
                    controller: passwordController,
                    hintText: "Eg: 12345678",
                    obscureText: false,
                    labelText: "Password"),
                Button(
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                  },
                  text: "Login",
                  width: 100,
                )
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.15,
            color: Colors.black,
          )
        ],
      ),
    ));
  }
}
