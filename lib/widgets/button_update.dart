import 'package:edu2gether_mobile/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonUpdate extends StatefulWidget {
  String route;
  String title;
  ButtonUpdate({Key? key, required this.route, required this.title}) : super(key: key);

  @override
  State<ButtonUpdate> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonUpdate> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          minimumSize: Size(MediaQuery.of(context).size.width, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Urbanist')
      ),
      onPressed: () {
        Get.toNamed(widget.route);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => const LoginAccount()),
        // );
      },
      child: Text(
        widget.title,
      ),
    );
  }
}
