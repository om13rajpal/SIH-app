import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final TextEditingController controller;

  const Search({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: "Search",
      hintStyle: const WidgetStatePropertyAll(TextStyle(
        color: Color(0xff939393),
        fontSize: 13,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      )),
      leading: const Icon(
        Icons.search,
        size: 20,
        color: Color(0xff939393),
      ),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xff939393)),
      )),
    );
  }
}
