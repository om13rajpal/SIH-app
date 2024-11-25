import 'package:drdo/login.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const Drdo());
}

class Drdo extends StatelessWidget{
  const Drdo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const Login(),
    );
  }

}