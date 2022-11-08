

import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/utilities/dimention_backup.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ReviewDetails extends StatefulWidget {
  const ReviewDetails({Key? key}) : super(key: key);

  @override
  State<ReviewDetails> createState() => _ReviewDetailsState();
}

class _ReviewDetailsState extends State<ReviewDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ) ,
            title: const Text(
              'Reviews',
            ),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      child:  Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            height: 38,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24, right: 24),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: Colors.blueAccent),
                                        color: Colors.blueAccent,
                                      ),
                                      width: 80,
                                      child: Column(
                                        children: <Widget>[
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                              child:
                                               Align(
                                                 alignment: Alignment.centerRight,
                                                 child: Row(
                                                   children: [
                                                     Icon(Icons.star_rate,size: 12,color: Colors.white,),
                                                     Padding(
                                                       padding: const EdgeInsets.only(left: 12),
                                                       child: Text(
                                                         'All',
                                                         style: TextStyle(fontFamily: 'Urbanist', fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
                                                         textAlign: TextAlign.center,
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: Colors.blueAccent),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      child: Column(
                                        children: <Widget>[
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                              child:
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.star_rate,size: 12,color: Colors.blueAccent,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12),
                                                      child: Text(
                                                        '4',
                                                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.blueAccent),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: Colors.blueAccent),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      child: Column(
                                        children: <Widget>[
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                              child:
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.star_rate,size: 12,color: Colors.blueAccent,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12),
                                                      child: Text(
                                                        '3',
                                                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.blueAccent),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: Colors.blueAccent),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      child: Column(
                                        children: <Widget>[
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                              child:
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.star_rate,size: 12,color: Colors.blueAccent,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12),
                                                      child: Text(
                                                        '2',
                                                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.blueAccent),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: Colors.blueAccent),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      child: Column(
                                        children: <Widget>[
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                              child:
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.star_rate,size: 12,color: Colors.blueAccent,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12),
                                                      child: Text(
                                                        '1',
                                                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.blueAccent),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: Colors.blueAccent),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      child: Column(
                                        children: <Widget>[
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                              child:
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.star_rate,size: 12,color: Colors.blueAccent,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12),
                                                      child: Text(
                                                        '4',
                                                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.blueAccent),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: Colors.blueAccent),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      child: Column(
                                        children: <Widget>[
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                              child:
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.star_rate,size: 12,color: Colors.blueAccent,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12),
                                                      child: Text(
                                                        '4',
                                                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.blueAccent),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
                Expanded(child: TabBarView(
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: DimensionB.height5),
                        itemCount: 6,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 24,right: 24),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                          const ExactAssetImage("assets/image/mentor.png"),
                                          radius: DimensionB.height8,
                                        ),
                                        SizedBox(width: DimensionB.width5,),
                                        BigText(text: "Francene Vandyne", fontweight: FontWeight.bold,),
                                      ],
                                    )),
                                    Row(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(Icons.star, size: 14, color: AppColors.mainColor,),
                                              SizedBox(width: DimensionB.width3,),
                                              Text("5", style: TextStyle(color: AppColors.mainColor),),
                                            ],
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.mainColor, width: 2),
                                            borderRadius: BorderRadius.circular(DimensionB.radius16),

                                          ),
                                        ),
                                        SizedBox(width: DimensionB.width5,),
                                        Icon(Icons.more)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: DimensionB.height3,),
                                SmallText(text: "The course is very good. The explanation of the mentor is very clear and easy to understand!", size: DimensionB.font5, color: Colors.black54,),
                                SizedBox(height: DimensionB.height3,),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.heart_broken, size: 20,),
                                        SizedBox(width: DimensionB.width5,),
                                        SmallText(text: "369", size: DimensionB.font5, color: Colors.black54, fontweight: FontWeight.bold,),
                                      ],
                                    ),
                                    SizedBox(width: DimensionB.width10,),
                                    Expanded(
                                      child: SmallText(text: "3 weeks ago", size: 14, color: Colors.black38,),

                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                )),
              ],
            ),
          ),
        ),
    );
  }
}
