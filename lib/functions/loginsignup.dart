import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

Future<String> authenticate(TextEditingController email,
    TextEditingController password, String type) async {
  if (email.text.isEmpty || password.text.isEmpty) {
    return "empty";
  } else {
    var body = (type == "signup")
        ? {
            "username": email.text.trim(),
            "password": password.text.trim(),
            "confirmPassword": password.text.trim()
          }
        : {"username": email.text.trim(), "password": password.text.trim()};

    var response = await http.post(
        Uri.parse("https://api.mlsc.tech/admin/${type}"),
        headers: {"Content-Type": "application/json", "isMobile": "true"},
        body: jsonEncode(body));

    var jsonRes = jsonDecode(response.body);
    print(jsonRes);

    if (jsonRes["status"] == "success") {
      if (type == "signin") {
        String token = jsonRes["data"]["userToken"];
        return token;
      } else {
        return "success";
      }
    } else {
      return "error";
    }
  }
}
