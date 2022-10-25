import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/dimensions.dart';
import '../../widgets/big_text.dart';
import 'home_body.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
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
                            child: CircleAvatar(
                              backgroundImage:
                              const ExactAssetImage("assets/images/mentor.png"),
                              foregroundColor: Colors.white,
                              radius: Dimension.width10,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Row(
                                  children: [
                                    SmallText(text: "Good Morning", color: Colors.black, size: 12, fontweight: FontWeight.w200,),
                                    Container(
                                      margin: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.waving_hand, color: Colors.black, size: 12,),
                                    )
                                  ],
                                )
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 16),
                                child: BigText(text: "Tran Quang Quyen", color: Colors.black, size: 16, fontweight: FontWeight.w700,),
                              )
                            ],
                          )
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
          // Container(
          //   child: Container(
          //       margin: EdgeInsets.only(top: 10,bottom: 15),
          //       padding: EdgeInsets.only(left: 24, right: 24),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Column(
          //             children: [
          //               Container(
          //                 width: 30,
          //                 height: 30,
          //                 child: Icon(Icons.home, color: Colors.blueAccent, size: 30,),
          //               ),
          //               DefinationBottomNavText(text: "Home", color: Colors.black26,)
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               Container(
          //                   width: 30,
          //                   height: 30,
          //                   child: Icon(Icons.view_list, color: Colors.blue, size: 30,)
          //               ),
          //               DefinationBottomNavText(text: "My Course", color: Colors.black26,)
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               Container(
          //                   width: 30,
          //                   height: 30,
          //                   child: Icon(Icons.chat, color: Colors.blue, size: 30,)
          //               ),
          //               DefinationBottomNavText(text: "Chat", color: Colors.black26,)
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               Container(
          //                   width: 30,
          //                   height: 30,
          //                   child: Icon(Icons.shopping_cart, color: Colors.blue, size: 30,)
          //               ),
          //               DefinationBottomNavText(text: "Transaction", color: Colors.black26,)
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               Container(
          //                   width: 30,
          //                   height: 30,
          //                   child: Icon(Icons.account_circle, color: Colors.blue, size: 30,)
          //               ),
          //               DefinationBottomNavText(text: "Profile", color: Colors.black26,)
          //             ],
          //           ),
          //
          //         ],
          //       )
          //   ),
          // )
        ],
      ),
    );
  }
}
