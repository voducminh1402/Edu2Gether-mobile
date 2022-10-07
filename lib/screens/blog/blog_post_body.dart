import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPostBody extends StatelessWidget {
  const BlogPostBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                        child: //SmallText(text: "05/10/2022", color: Colors.black, size: 16, fontweight: FontWeight.w400,),
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
                      color:Colors.black38,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/image/advancedjava.png"
                          )
                      )
                  ),
                ),
                Container(
                  width: 380,
                  height: 700,
                  margin: EdgeInsets.only(top: 24),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. "
                        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
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
    );
  }
}
