import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText(
      {Key? key,
        this.color = Colors.black,
        required this.text,
        this.size = 0,
        this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? 20 : size,
          fontWeight: FontWeight.w400,
          fontFamily: 'Urbanist'),
    );
  }
}
