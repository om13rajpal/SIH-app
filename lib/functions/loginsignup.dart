import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

Future<String> authenticate(TextEditingController email,
    TextEditingController password, String type) async {
  if (email.text.isEmpty || password.text.isEmpty) {
    return "empty";
  } else {
    var body = {"email": email.text.trim(), "password": password.text.trim()};

    var response = await http.post(Uri.parse("http://localhost:3000/$type"),
        headers: {"Content-Type": "application/json", "isMobile": "true"},
        body: jsonEncode(body));

    var jsonRes = jsonDecode(response.body);

    if (jsonRes["status"] == true) {
      String token = jsonRes["token"];
      return token;
    } else {
      return "error";
    }
  }
}
