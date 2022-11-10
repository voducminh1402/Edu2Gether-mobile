import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPostBody extends StatefulWidget {
  const BlogPostBody({Key? key}) : super(key: key);

  @override
  State<BlogPostBody> createState() => _BlogPostBodyState();
}

class _BlogPostBodyState extends State<BlogPostBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 380,
          height: 80,
          margin: EdgeInsets.only(top: 10, left: 24, right: 24, bottom: 24),
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
                        Text('Q05/10/2022', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),)
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
                            "assets/images/Software_developer.png"
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
    );
  }
}
