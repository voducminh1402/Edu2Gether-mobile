import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';
import 'notificaction_body.dart';

class NofiticationPage extends StatefulWidget {
  const NofiticationPage({Key? key}) : super(key: key);

  @override
  State<NofiticationPage> createState() => _NofiticationPageState();
}

class _NofiticationPageState extends State<NofiticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //show header
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
            padding: EdgeInsets.only(top: 9.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(() => MainPage());
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                      ),
                    ),
                    //BigText(text: "Notification", color: Colors.black, size: 24, fontweight: FontWeight.w700,)
                    Text('Notification', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),)

                  ],
                ),
                Container(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.more_horiz_outlined, color: Colors.black, size: 30,)
                ),
              ],
            ),
          ),
          //show body
          Expanded(child: SingleChildScrollView(
            child: NotificationBody(),
          )
          ),
        ],
      ),
    );
  }
}
