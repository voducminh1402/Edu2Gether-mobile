import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/defination_bottom_nav_text.dart';
import 'home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //show header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width:32,
                            height: 32,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color:Colors.white38,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/image/Logo-edu2-fix-02.png"
                                    )
                                )
                            ),
                          ),
                          BigText(text: "Edu2Gether", color: Colors.black, size: 24, fontweight: FontWeight.w700,)
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: Icon(Icons.notifications_none, color: Colors.black, size: 30,),
                      ),
                      Container(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.bookmark_outline, color: Colors.black, size: 30,)
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
          //show body
          Expanded(child: SingleChildScrollView(
            child: HomePageBody(),
          )
          ),
          //Bottom nav bar
          Container(
            child: Container(
                margin: EdgeInsets.only(top: 10,bottom: 15),
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: Icon(Icons.home, color: Colors.blueAccent, size: 30,),
                        ),
                        DefinationBottomNavText(text: "Home", color: Colors.black26,)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.view_list, color: Colors.blue, size: 30,)
                        ),
                        DefinationBottomNavText(text: "My Course", color: Colors.black26,)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.chat, color: Colors.blue, size: 30,)
                        ),
                        DefinationBottomNavText(text: "Chat", color: Colors.black26,)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.shopping_cart, color: Colors.blue, size: 30,)
                        ),
                        DefinationBottomNavText(text: "Transaction", color: Colors.black26,)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.account_circle, color: Colors.blue, size: 30,)
                        ),
                        DefinationBottomNavText(text: "Profile", color: Colors.black26,)
                      ],
                    ),

                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
