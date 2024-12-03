import 'package:flutter/material.dart';

class Sort extends StatefulWidget {
  const Sort({super.key});

  @override
  State<Sort> createState() => _SortState();
}

class _SortState extends State<Sort> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xff939393), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            hint: const Text("Sort by",
                style: TextStyle(
                  color: Color(0xff939393),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                )),
            isExpanded: true,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(
                value: "latest",
                child: Text("Latest"),
              ),
              DropdownMenuItem(
                value: "oldest",
                child: Text("Oldest"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          width: 90,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xff939393), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            hint: const Text("All",
                style: TextStyle(
                  color: Color(0xff939393),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                )),
            isExpanded: true,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(
                value: "latest",
                child: Text("Latest"),
              ),
              DropdownMenuItem(
                value: "oldest",
                child: Text("Oldest"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        )
      ],
    );
  }
}
