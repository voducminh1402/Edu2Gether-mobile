import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MostPopularCourseBody extends StatefulWidget {
  const MostPopularCourseBody({Key? key}) : super(key: key);

  @override
  State<MostPopularCourseBody> createState() => _MostPopularCourseBodyState();
}

class _MostPopularCourseBodyState extends State<MostPopularCourseBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //list transaction
        Container(
          width: 380,
          height: 774,
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              Container(
                width: 380,
                height: 38,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: 11),
                      child: Row(
                        children: [
                          Container(
                              width: 133,
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.blueAccent,
                                    style: BorderStyle.solid,
                                    width: 2.0
                                ),
                                color:Colors.white,
                              ),
                              child:
                              Container(
                                margin: EdgeInsets.only(left: 30, top: 7),
                                child: BigText(text: "3D Design", color: Colors.blueAccent, size: 16, fontweight: FontWeight.w600,),
                              )
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: 380,
                height: 688,
                margin: EdgeInsets.only(top: 24, left: 20),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 343,
                            height: 160,
                            child: Row(
                              children: [
                                Container(
                                  width:120,
                                  height: 120,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color:Colors.black38,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/image/advancedjava.png"
                                          )
                                      )
                                  ),
                                ),
                                Container(
                                  width: 204,
                                  height: 120,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 66,
                                              height: 24,
                                              margin: EdgeInsets.only(bottom: 12),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color:Colors.black12,
                                              ),
                                              child:
                                              Container(
                                                margin: EdgeInsets.only(left: 12, top: 5),
                                                child: BigText(text: "Back-end", color: Colors.blueAccent, size: 10, fontweight: FontWeight.w600,),
                                              )
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 12),
                                            child: BigText(text: "Advanced Java", color: Colors.black, fontweight: FontWeight.w700, size: 18,),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 12),
                                            child: BigText(text: "\$50", color: Colors.blueAccent, fontweight: FontWeight.w700, size: 18,),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(right: 8),
                                                child: Icon(Icons.star_half, color: Colors.black, size: 16,),
                                              ),
                                              SmallText(text: "4.8 | 8.289 students", color: Colors.black38,),
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 50, bottom: 100),
                                        child: Icon(Icons.bookmark_outline, color: Colors.blueAccent, size: 25,),
                                      )
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
          ),
        )
      ],
    );
  }
}
