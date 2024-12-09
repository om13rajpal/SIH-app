import 'package:drdo/components/background.dart';
import 'package:drdo/components/button.dart';
import 'package:drdo/components/input.dart';
import 'package:drdo/components/loginsignup.dart';
import 'package:drdo/components/text.dart';
import 'package:drdo/functions/loginsignup.dart';
import 'package:drdo/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
  }

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
                          onPressed: () async {
                            String token = await authenticate(
                                emailController, passwordController, "signup");
                            print(token);

                            if (token == "error") {
                              Fluttertoast.showToast(
                                  msg: "An error occured",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (token == "empty") {
                              Fluttertoast.showToast(
                                  msg: "Please fill all the fields",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Successfully Registered",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              if (!context.mounted) return;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            }
                          },
                          text: "Register",
                          width: 100,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const LoginSignup(
                          text: "Login",
                          question: 'Already registered in the app?',
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
