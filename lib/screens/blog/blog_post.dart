import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BlogPostPage extends StatefulWidget {
  const BlogPostPage({Key? key}) : super(key: key);

  @override
  State<BlogPostPage> createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(

            icon: const Icon(

              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(() => MainPage());
              // Navigator.pop(context,
              //     MaterialPageRoute(builder: (context) => const TransactionPage()));
            },
          ),

          elevation: 0
      ),
      body: Column(
        children: [
          //show body
          Expanded(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 380,
                  height: 80,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin:EdgeInsets.only(left: 24, bottom: 20),
                          child: //BigText(text: "How to be a Dev?", size: 24, fontweight: FontWeight.w700, color: Colors.black,),
                          Text('How to be a Dev?', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),)

                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Container(
                              margin:EdgeInsets.only(right: 5),
                              child: Icon(Icons.history_edu_outlined, color: Colors.blueAccent, size: 25,),
                            ),
                            Container(
                                margin:EdgeInsets.only(right: 30),
                                child: //SmallText(text: "Quang Quyen", color: Colors.black, size: 16, fontweight: FontWeight.w400,),
                                Text('Quang Quyen', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),)

                            ),
                            Container(
                              margin:EdgeInsets.only(right: 5),
                              child: Icon(Icons.date_range_outlined, color: Colors.blueAccent, size: 25,),
                            ),
                            Container(
                                child: //SmallText(text: "05/10/2022 ", color: Colors.black, size: 16, fontweight: FontWeight.w400,),
                                Text('05/10/2022', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),)
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: [
                      Container(
                        width: 380,
                        height: 220,
                        decoration: BoxDecoration(
                            color:Colors.white10,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/software-developer.jpeg"
                                )
                            )
                        ),
                      ),
                      Container(
                        width: 380,
                        height: 700,
                        margin: EdgeInsets.only(top: 24),
                        child: Text(
                          "Software developers use their programming skills to create new software and update existing applications. If you’re a creative thinker who enjoys problem solving, a career as a software developer could be a good fit."

                              "Software is essential in nearly every industry, which means you can pursue a career in a field that aligns with your passions and interests. Learn more about this rapidly growing career, discover course recommendations to build skills, and 10 tips to get a job as a software developer.",
                          maxLines: 1000,
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
          ),
        ],
      ),
    );
  }
}
