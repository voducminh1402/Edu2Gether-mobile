
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

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
import '../mentor/top_mentor.dart';
import '../mostpopularcourse/mostpopularcourse.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {

  late List<Course>? _courses = [];
  late List<Subject>? _subject = [];
  List<Mentor>? _mentors;
  var isLoaded = false;

  //int id = 1;

  @override
  void initState() {
    super.initState();
    _getData();
    _getDataSubject();
    _getDataMentor();
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

  void _getDataMentor() async {
    _mentors = (await MentorService().getMentor())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_mentors != null){
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Container(
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
                  width: 380,
                  height: 180,
                  child: PageView.builder(
                      itemCount: 5,
                      itemBuilder: (context, position){
                        return Container(
                          width:380,
                          height: 160,
                          margin: EdgeInsets.only(top: 20, right: 10, left: 10),
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
                        );
                      }
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
                          itemCount: _mentors?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(right: 11),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      //
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: CircleAvatar(
                                          backgroundImage:
                                          NetworkImage(_mentors![index].image),
                                          foregroundColor: Colors.white,
                                          radius: Dimension.width13,
                                        ),

                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(_mentors![index].fullName,
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
                        height: 210,
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
                                                  Icon(Icons.bookmark, color: AppColors.mainColor, size: Dimension.font10,)
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
                                                        text: _courses![i].estimateHour.toString() + " Hours", style: TextStyle(color: Colors.black38)
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}