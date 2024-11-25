import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Color? colour;
  final Widget? child;

  const Background({super.key, this.colour, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: (colour != null) ? colour : Colors.white,
      child: child,
    );
  }
}
