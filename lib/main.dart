import 'package:drdo/homepage.dart';
import 'package:drdo/login.dart';
import 'package:drdo/panel.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString("token");
  runApp(Drdo(
    token: token,
  ));
}

class Drdo extends StatefulWidget {
  final String? token;
  const Drdo({super.key, this.token});

  @override
  State<Drdo> createState() => _DrdoState();
}

class _DrdoState extends State<Drdo> {
  bool isLoggedIn = false;
  @override
  void initState() {
    checkToken(widget.token);
    super.initState();
  }

  void checkToken(String? token) async {
    if (token != null) {
      try {
        if (!JwtDecoder.isExpired(token)) {
          isLoggedIn = true;
          print("Token valid");
        }
      } catch (e) {
        print("Token invalid");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: (isLoggedIn) ? const Panel() : const Panel(),
    );
  }
}
