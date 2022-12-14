import 'package:edu2gether_mobile/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonLogin extends StatefulWidget {
  String route;
  String title;
  ButtonLogin({Key? key, required this.route, required this.title}) : super(key: key);

  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          minimumSize: Size(MediaQuery.of(context).size.width, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
      ),
      onPressed: () {
        Get.toNamed(widget.route);
      },
      child: Text(
        widget.title,
      ),
    );
  }
}
