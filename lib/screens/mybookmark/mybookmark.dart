import 'package:edu2gether_mobile/screens/mybookmark/mybookmark_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';

class MyBookmarkPage extends StatefulWidget {
  const MyBookmarkPage({Key? key}) : super(key: key);

  @override
  State<MyBookmarkPage> createState() => _MyBookmarkPageState();
}

class _MyBookmarkPageState extends State<MyBookmarkPage> {
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
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                      ),
                    ),
                    BigText(text: "My Bookmark", color: Colors.black, size: 24, fontweight: FontWeight.w700,)
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
            child: MyBookmarkBody(),
          )
          ),
        ],
      ),
    );
  }
}
