import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefinationBottomNavText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  DefinationBottomNavText({Key? key, this.color = Colors.blueAccent,
    required this.text,
    this.size=14,
    this.height=1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: 'Urbanist',
          fontSize: size,
          height: height
      ),
    );
  }
}
