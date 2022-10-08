import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  FontWeight? fontweight;

  SmallText({Key? key,
    this.color = Colors.black,
    required this.text,
    this.size = 0,
    this.height = 1.2,
    this.fontweight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? Dimension.font6 : size,
          fontFamily: 'Urbanist',
          height: height,
          fontWeight: fontweight,
      ),
    );
  }
}