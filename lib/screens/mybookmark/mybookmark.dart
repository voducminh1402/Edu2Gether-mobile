

import 'package:edu2gether_mobile/screens/mybookmark/mybookmark_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/course.dart';
import '../../services/course_service.dart';
import '../../utilities/colors.dart';
import '../../utilities/dimensions.dart';
import '../../widgets/big_text.dart';

class MyBookmarkPage extends StatefulWidget {
  String id;
  MyBookmarkPage({required this.id,Key? key}) : super(key: key);

  @override
  State<MyBookmarkPage> createState() => _MyBookmarkPageState();
}

class _MyBookmarkPageState extends State<MyBookmarkPage> {

  late List<Course>? _courses = [];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _courses = (await CourseService().getBookmarkByUserId(widget.id))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_courses != null ){
      isLoaded = true;
    }
  }

  @override
  void dispose(){
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return !isLoaded ? const Scaffold(body: Center(child: CircularProgressIndicator(),)) :
    Scaffold(
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
                    //BigText(text: "My Bookmark", color: Colors.black, size: 24, fontweight: FontWeight.w700,)
                    Text('My Bookmark', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),)

                  ],
                ),
                Container(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.more_horiz_outlined, color: Colors.black, size: 30,)
                ),
              ],
            ),
          ),
          //show body
          Expanded(child: SingleChildScrollView(
            child: Column(
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
                            itemCount: _courses!.length,
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
                                          child: Image.network(_courses![i].image.toString()),
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
                                                    child: Text("Marked", style: TextStyle(color: Colors.white),),
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
                                                _courses![i].name.toString(),
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
                                                  text: '\$${_courses![i].price.toString()}',
                                                  style: TextStyle(
                                                    fontSize: Dimension.font6,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueAccent,
                                                  ), // default text style
                                                  // children: <TextSpan>[
                                                  //   TextSpan(
                                                  //     text: ' \$80',
                                                  //     style: TextStyle(
                                                  //       fontSize: Dimension.font5,
                                                  //       color: Colors.black38,
                                                  //     ),
                                                  //   ),
                                                  // ],
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
            ),
          )
          ),
        ],
      ),
    );
  }
}
