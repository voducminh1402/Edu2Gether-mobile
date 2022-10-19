import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/dimensions.dart';
import '../../widgets/small_text.dart';

class TopMentorBody extends StatefulWidget {
  const TopMentorBody({Key? key}) : super(key: key);

  @override
  State<TopMentorBody> createState() => _TopMentorBodyState();
}

class _TopMentorBodyState extends State<TopMentorBody> {
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
                            child: CircleAvatar(
                              backgroundImage:
                              const ExactAssetImage("assets/images/mentor.png"),
                              foregroundColor: Colors.white,
                              radius: Dimension.width15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 60, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //BigText(text: "Jacob Kulikowsky", color: Colors.black, fontweight: FontWeight.w700, size: 18,),
                                Text('Jacob Kulikowsky', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),),

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
              );
            },
          ),
        )
      ],
    );
  }
}
