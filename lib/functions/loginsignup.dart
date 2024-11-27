import "dart:convert";
import "package:http/http.dart" as http;

Future<void> authenticate(String email, String password, String Type) async {
  var body = {"email": email, "password": password};

  var response = await http.post(Uri.parse("http://localhost:3000/${Type}"),
      headers: {"Content-Type": "application/json", "isMobile": "true"},
      body: jsonEncode(body));

  var jsonRes = jsonDecode(response.body);

  if (jsonRes["success"] == true) {
    print("authenticated");
  } else {
    print("not authenticated");
  }
}
