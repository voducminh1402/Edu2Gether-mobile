import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../utilities/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MyBookmarkBody extends StatefulWidget {
  const MyBookmarkBody({Key? key}) : super(key: key);

  @override
  State<MyBookmarkBody> createState() => _MyBookmarkBodyState();
}

class _MyBookmarkBodyState extends State<MyBookmarkBody> {
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
                height: 774,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: Dimension.height5),
                    itemCount: 6,
                    itemBuilder: (context, i) {
                      return Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(Dimension.radius12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(62), // Image radius
                                  child: Image.asset('assets/images/course.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text("3D Design", style: TextStyle(color: Colors.white),),
                                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                            decoration: BoxDecoration(
                                              color: AppColors.mainColor,
                                              border: Border.all(color: Colors.blue),
                                              borderRadius: BorderRadius.circular(6),

                                            ),
                                          ),
                                          Icon(Icons.bookmark, color: AppColors.mainColor, size: Dimension.font10,)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '3D Design Illustration',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Urbanist'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: '\$48',
                                          style: TextStyle(
                                            fontSize: Dimension.font6,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                          ), // default text style
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' \$80',
                                              style: TextStyle(
                                                fontSize: Dimension.font5,
                                                color: Colors.black38,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: Dimension.height3,),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Icon(Icons.star, size: Dimension.font5),
                                            ),
                                            WidgetSpan(child: SizedBox(width: Dimension.width3,),),
                                            TextSpan(
                                                text: "4.7 | ",
                                                style: TextStyle(color: Colors.black38)
                                            ),
                                            TextSpan(
                                                text: "7,938 students", style: TextStyle(color: Colors.black38)
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ));
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
