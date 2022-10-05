import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  FontWeight? fontweight;
  SmallText({Key? key, this.color = Colors.black26,
    required this.text,
    this.size=12,
    this.height=1.2,
    this.fontweight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color,
          fontFamily: 'Urbanist',
          fontSize: size,
          height: height,
          fontWeight: fontweight,
      ),
    );
  }
}
