import 'package:edu2gether_mobile/screens/blog/blog_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class BlogBody extends StatelessWidget {
  const BlogBody({Key? key}) : super(key: key);

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
                                child: BigText(text: "Back-end", color: Colors.blueAccent, size: 16, fontweight: FontWeight.w600,),
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
                margin: EdgeInsets.only(top: 24, left: 10),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 353,
                            height: 160,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const BlogPostPage()),
                                    );
                                  },
                                  child: Container(
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
                                ),
                                Container(
                                  width: 220,
                                  height: 120,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const BlogPostPage()),
                                          );
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 25),
                                              child: BigText(text: "How to be a Dev?", color: Colors.black, fontweight: FontWeight.w700, size: 18,),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(bottom: 35),
                                              child: SmallText(text: "Lorem ipsum dolor sit..", color: Colors.black54,),
                                            )
                                          ],
                                        ),
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
