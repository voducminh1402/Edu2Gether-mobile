import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class TopMentorBody extends StatelessWidget {
  const TopMentorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //list transaction
        Container(
          width: 380,
          height: 700,
          margin: EdgeInsets.only(left: 30, right: 24),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    Container(
                      width: 340,
                      height: 60,
                      child: Row(
                        children: [
                          Container(
                            width:60,
                            height: 60 ,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color:Colors.white38,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/image/advancedjava.png"
                                    )
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 85),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Jacob Kulikowsky", color: Colors.black, fontweight: FontWeight.w700, size: 18,),
                                SizedBox(height: 4,),
                                SmallText(text: "Marketng Analyst", color: Colors.black26,),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    margin: EdgeInsets.only(bottom: 10, left: 12),
                                    child: Icon(Icons.chat_outlined, color: Colors.blueAccent, size: 20),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
                //   margin: EdgeInsets.only(left: 30, right: 20),
                //   child: Row(
                //     children: [
                //       //image section
                //       Container(
                //         width:140,
                //         height: 120,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(25),
                //             color:Colors.white38,
                //             image: DecorationImage(
                //                 image: AssetImage(
                //                     "assets/image/advancedjava.png"
                //                 )
                //             )
                //         ),
                //       ),
                //       //text container
                //       Expanded(
                //         child: Container(
                //           width: 100,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.only(
                //               topRight: Radius.circular(20),
                //               bottomRight: Radius.circular(20)
                //             ),
                //             color: Colors.white,
                //           ),
                //           child: Padding(
                //             padding: EdgeInsets.only(left: 10, right: 10),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Container(
                //                   margin: EdgeInsets.only(top: 10),
                //                 ),
                //                 BigText(text: "Advanced Java Development", color: Colors.black, fontweight: FontWeight.w700, size: 18,),
                //                 SizedBox(height: 10,),
                //                 SmallText(text: "Paid", color: Colors.blueAccent,),
                //                 SizedBox(height: 10,),
                //                 Row(
                //                   mainAxisAlignment: MainAxisAlignment.end,
                //                   children: [
                //                     Container(
                //                       width: 10,
                //                       height: 10,
                //                       margin: EdgeInsets.only(right: 15, bottom: 10),
                //                       child: Icon(Icons.paid, color: Colors.blueAccent, size: 20),
                //                     ),
                //                     DefinationBottomNavText(text: "E-Receipt")
                //                   ],
                //                 ),
                //                 SizedBox(height: 15,),
                //               ],
                //             ),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
              );
            },
          ),
        )
      ],
    );
  }
}
