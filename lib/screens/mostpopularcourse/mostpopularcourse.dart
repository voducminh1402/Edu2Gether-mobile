import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import 'mostpopularcourse_body.dart';

class MostPopularCourse extends StatefulWidget {
  const MostPopularCourse({Key? key}) : super(key: key);

  @override
  State<MostPopularCourse> createState() => _MostPopularCourseState();
}

class _MostPopularCourseState extends State<MostPopularCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //show header
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
            padding: EdgeInsets.only(top: 9.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                      ),
                    ),
                    //BigText(text: "Most Popular Course", color: Colors.black, size: 24, fontweight: FontWeight.w700,)
                    Text('Most Popular Course', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),),

                  ],
                ),
                Container(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.search, color: Colors.black, size: 30,)
                ),
              ],
            ),
          ),
          //show body
          Expanded(child: SingleChildScrollView(
            child: MostPopularCourseBody(),
          )
          ),
        ],
      ),
    );
  }
}
