import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  FontWeight? fontweight;
  TextOverflow overflow;
  BigText({Key? key, this.color = Colors.blueAccent,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 18,
    this.fontweight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontFamily: 'Urbanist',
        fontWeight: fontweight,
        fontSize: size,
        fontStyle: FontStyle.normal
      ),
    );
  }
}
