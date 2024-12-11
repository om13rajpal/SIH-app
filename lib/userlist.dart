import 'dart:convert';

import 'package:drdo/components/background.dart';
import 'package:drdo/components/mainheading.dart';
import 'package:drdo/components/numbers.dart';
import 'package:drdo/components/searchbar.dart';
import 'package:drdo/components/sectionheading.dart';
import 'package:drdo/components/sortnsearch.dart';
import 'package:drdo/components/userdetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserList extends StatefulWidget {
  final String pageType;
  const UserList({super.key, required this.pageType});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  String? selectedValue;
  List data = [];
  @override
  void initState() {
    getUserList();
    super.initState();
  }

  void getUserList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http
        .get(Uri.parse("https://api.black-swan.tech/${widget.pageType}"), headers: {
      "Content-Type": "application/json",
      "ismobile": "true",
      "authorization": "Bearer $token"
    });

    var jsonRes = await jsonDecode(response.body);

    if (jsonRes["status"] == "success") {
      print(jsonRes);
      List userData = jsonRes["data"]["${widget.pageType}s"];
      List<Map<dynamic, dynamic>> userList = userData.map((exp) {
        return {
          "name": exp["name"],
          "age": exp["dateOfBirth"] != null
              ? DateTime.now().year - DateTime.parse(exp["dateOfBirth"]).year
              : 0,
          "work": widget.pageType == "expert" ? exp["currentPosition"] : exp["gender"],
          "id":exp["_id"]

        };
      }).toList();

      setState(() {
        data = userList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
        body: Background(
            child: Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Mainheading(
                  text:
                      (widget.pageType == "expert") ? "Experts" : "Candidates"),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Numbers(
                      label: (widget.pageType == "expert")
                          ? "All Experts"
                          : "All Candidates",
                      value: "11.26 K"),
                  const Numbers(label: "Male", value: "518"),
                  const Numbers(label: "Female", value: "1009"),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              SizedBox(height: 32, child: Search(controller: controller)),
              const SizedBox(
                height: 8,
              ),
              const Sort(),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Color(0xffB8B8B8),
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 15,
              ),
              Sectionheading(
                  text: (widget.pageType == "expert")
                      ? "Top Experts"
                      : "Top Candidates"),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: UserDetail(
                          name: data[index]["name"],
                          age: data[index]["age"].toString(),
                          work: data[index]["work"],
                          id: data[index]["id"],
                          type: widget.pageType,
                          percent: 0.76),
                    );
                  }),
            ],
          ),
        ),
      ),
    )));
  }
}
