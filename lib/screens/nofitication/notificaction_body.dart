import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({Key? key}) : super(key: key);

  @override
  State<NotificationBody> createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //list transaction
        Container(
          width: 380,
          height: 866,
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              Container(
                width: 380,
                height: 794,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return Container(
                      child: Row(
                        children: [
                          Container(
                            width: 360,
                            height: 294,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 40),
                                  child: BigText(text: "Today", size: 18, fontweight: FontWeight.w700, color: Colors.black,),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 24),
                                  child: Row(
                                    children: [
                                      Container(
                                        width:83,
                                        height: 80,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color:Colors.black38,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/image/noti.png"
                                                )
                                            )
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 8),
                                              child: BigText(text: "Payment Successful!", size: 18, fontweight: FontWeight.w700, color: Colors.black,),
                                            ),
                                            Container(
                                              child: SmallText(text: "You have made a course payment", size: 14, fontweight: FontWeight.w400, color: Colors.black54),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 24),
                                  child: Row(
                                    children: [
                                      Container(
                                        width:83,
                                        height: 80,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color:Colors.black38,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/image/noti2.png"
                                                )
                                            )
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 8),
                                              child: BigText(text: "Today’s Special Offers", size: 18, fontweight: FontWeight.w700, color: Colors.black,),
                                            ),
                                            Container(
                                              child: SmallText(text: "You get a special promo today!", size: 14, fontweight: FontWeight.w400, color: Colors.black54,),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
