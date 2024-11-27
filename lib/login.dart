import 'package:drdo/components/background.dart';
import 'package:drdo/components/button.dart';
import 'package:drdo/components/loginsignup.dart';
import 'package:drdo/components/text.dart';
import 'package:drdo/components/input.dart';
import 'package:drdo/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: LottieBuilder.asset(
            'assets/lottie/back.json',
            width: screenWidth,
            fit: BoxFit.contain,
            renderCache: RenderCache.raster,
          ),
        ),
        Background(
          colour: Colors.white54,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.25,
                child: Center(
                    child: TextData(
                  text: "DRDO RAC",
                  fontSize: screenWidth * 0.070,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
              ),
              SizedBox(
                height: screenHeight * 0.55,
                width: screenWidth * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Input(
                          controller: emailController,
                          hintText: "Eg: omrajpal.exe@gmail.com",
                          obscureText: false,
                          labelText: "Email",
                          icon: const Icon(
                            Icons.email,
                            size: 17,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.035,
                        ),
                        Input(
                          controller: passwordController,
                          hintText: "Eg: 12345678",
                          obscureText: true,
                          labelText: "Password",
                          icon: const Icon(
                            Icons.lock,
                            size: 17,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Button(
                          onPressed: () {
                            (emailController.text.isEmpty ||
                                    passwordController.text.isEmpty)
                                ? Fluttertoast.showToast(
                                    msg: "All the fields are required",
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Homepage(),
                                    ));
                          },
                          text: "Login",
                          width: 100,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const LoginSignup(
                          text: "Sign up",
                          question: 'New to this app?',
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.15,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
