import 'package:edu2gether_mobile/screens/checkout/choose_type_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MomoCheckOut extends StatelessWidget {
   MomoCheckOut({super.key, required this.id});
   int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
              onPressed: () => Get.to(() => ChooseTypeCheckout(id: id)),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ) ,
            title: const Text(
              'Momo',
            ),
            
          ),
          body: Column(children: [
            Image.asset("assets/images/momo_qr.jpg")
            ]));
  }
}