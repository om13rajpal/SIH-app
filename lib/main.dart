import 'package:drdo/homepage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const Drdo());
}

class Drdo extends StatelessWidget{
  const Drdo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const Homepage(),
    );
  }

}