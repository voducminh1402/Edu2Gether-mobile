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
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            padding: EdgeInsets.only(top: 9.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 15),
                        child: Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                      ),
                    ),
                    //BigText(text: "My Bookmark", color: Colors.black, size: 24, fontweight: FontWeight.w700,)
                    Text('Transaction', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),)

                  ],
                ),
              ],
            ),
          ),
          //show body
          Expanded(child: SingleChildScrollView(
            child: TransactionBody(),
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
