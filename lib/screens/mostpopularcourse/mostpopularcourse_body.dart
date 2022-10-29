import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/course.dart';
import '../../models/mentor.dart';
import '../../models/subject.dart';
import '../../services/course_service.dart';
import '../../services/mentor_service.dart';
import '../../services/subject_service.dart';

import '../../utilities/colors.dart';
import '../../utilities/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MostPopularCourseBody extends StatefulWidget {
  const MostPopularCourseBody({Key? key}) : super(key: key);

  @override
  State<MostPopularCourseBody> createState() => _MostPopularCourseBodyState();
}

class _MostPopularCourseBodyState extends State<MostPopularCourseBody> {

  late List<Course>? _courses = [];
  late List<Subject>? _subject = [];
  var isLoaded = false;

  //int id = 1;

  @override
  void initState() {
    super.initState();
    _getData();
    _getDataSubject();
  }

  void _getData() async {
    _courses = (await CourseService().getCourses())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_courses != null){
      isLoaded = true;
    }
  }

  void _getDataSubject() async{
    _subject = (await SubjectService().getSubject())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_subject != null){
      isLoaded = true;
    }
  }

  @override
  void dispose(){
    super.dispose();
  }

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
                                              child: Text("Best Seller", style: TextStyle(color: Colors.white),),
                                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                              decoration: BoxDecoration(
                                                color: AppColors.mainColor,
                                                border: Border.all(color: Colors.blue),
                                                borderRadius: BorderRadius.circular(6),

                                              ),
                                            ),
                                            Icon(Icons.bookmark_outline, color: AppColors.mainColor, size: Dimension.font10,)
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          _courses![i].name,
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
                                            text: '\$' + _courses![i].price.toString(),
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
                                                  text:  _courses![i].estimateHour.toString() + " Hours", style: TextStyle(color: Colors.black38)
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ));
                      }),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}