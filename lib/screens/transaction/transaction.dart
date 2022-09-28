import 'package:edu2gether_mobile/screens/transaction/transaction_body.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/defination_bottom_nav_text.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //show header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Transaction", color: Colors.blueAccent, size: 30,)
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: Icon(Icons.search, color: Colors.blueAccent, size: 30,),
                      ),
                      Container(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.more_horiz_outlined, color: Colors.blue, size: 30,)
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
          //show body
          Expanded(child: SingleChildScrollView(
            child: TransactionBody(),
            )
          ),
          //Bottom nav bar
          Container(
            child: Container(
                margin: EdgeInsets.only(top: 10,bottom: 15),
                padding: EdgeInsets.only(left: 30, right: 30),
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
                        DefinationBottomNavText(text: "Home")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.view_list, color: Colors.blue, size: 30,)
                        ),
                        DefinationBottomNavText(text: "My Course")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.chat, color: Colors.blue, size: 30,)
                        ),
                        DefinationBottomNavText(text: "Chat")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.shopping_cart, color: Colors.blue, size: 30,)
                        ),
                        DefinationBottomNavText(text: "Transaction")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.account_circle, color: Colors.blue, size: 30,)
                        ),
                        DefinationBottomNavText(text: "Profile")
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
