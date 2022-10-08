import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../mentor/top_mentor.dart';
import '../mostpopularcourse/mostpopularcourse.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 380,
          height: 700,
          margin: EdgeInsets.only(left: 24, right: 24, top: 10),
          child: Column(
            children: [
              Container(
                width: 380,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search',
                  ),
                ),
              ),
              Container(
                width:380,
                height: 160,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color:Colors.black12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: BigText(text: "How to be a Dev?", color: Colors.black, size: 20, fontweight: FontWeight.w600,),
                    ),
                    Container(
                      width: 380,
                      height: 100,
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. "
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                        maxLines: 5,
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 380,
                height: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(text: "Top Mentor", color: Colors.black, size: 16, fontweight: FontWeight.w600,),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const TopMentorPage()),
                                );
                              },
                              child: BigText(text: "See All", color: Colors.black, size: 16, fontweight: FontWeight.w600,))
                        ],
                      ),
                    ),
                    Container(
                      width: 380,
                      height: 110,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(right: 11),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      margin: EdgeInsets.only(right: 14, top: 20),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color:Colors.black38,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/mentor.png"
                                              )
                                          )
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("Tanner Stafold",
                                        maxLines: 1,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: 'Urbanist',
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 380,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(text: "Most Popular Course", color: Colors.black, size: 16, fontweight: FontWeight.w600,),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const MostPopularCourse()),
                                );
                              },
                              child: BigText(text: "See All", color: Colors.black, size: 16, fontweight: FontWeight.w600,))
                        ],
                      ),
                    ),
                    Container(
                      width: 380,
                      margin: EdgeInsets.only(top: 20),
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
                                    width: 110,
                                    height: 28,
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
                                      margin: EdgeInsets.only(left: 25, top: 3),
                                      child: BigText(text: "3D Design", color: Colors.blueAccent, size: 14, fontweight: FontWeight.w600,),
                                    )
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width:380,
                      height: 180,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color:Colors.black12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width:120,
                            height: 120,
                            margin: EdgeInsets.only(right: 12, left: 12),
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
                          Row(
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
                                child: Icon(Icons.bookmark_outlined, color: Colors.blueAccent, size: 25,),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
