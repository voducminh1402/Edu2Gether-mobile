import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/models/subject.dart';
import 'package:edu2gether_mobile/screens/course_detail/video_course_details.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
import 'package:edu2gether_mobile/services/course_service.dart';
import 'package:edu2gether_mobile/services/major_service.dart';
import 'package:edu2gether_mobile/services/mark_service.dart';
import 'package:edu2gether_mobile/services/subject_service.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class MostPopularCourse extends StatefulWidget {
  const MostPopularCourse({Key? key}) : super(key: key);

  @override
  State<MostPopularCourse> createState() => _MostPopularCourseState();
}

class _MostPopularCourseState extends State<MostPopularCourse> {

  final List<String> _searchTerms = [
    "Software Engineering",
    "Graphic Design",
    "International Business",
  ];
  late List<Course>? _courses = [];
  late List<Subject>? _subjects = [];
  List<Major>? _majors = [];
  late List<String>? _majorNames = [];
  List<bool>? _isMarks = [];
  String? _search;
  String? _menteeId;
  int _majorIndex = 0;
  var isLoaded = false;

  //int id = 1;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    await AuthService().getUserLogin().then((value) async {
      _menteeId = value.id;
    });
    _courses = (await CourseService().getCourses())!;
    _subjects = (await SubjectService().getSubject())!;
    _majorNames!.add("All");
    _majors = (await MajorService().getMajors())!;
    if(_courses != null && _subjects != null && _majors != null){
      isLoaded = true;
      for(var course in _courses!){
        bool? isMark = await MarkService().checkMark(_menteeId, course.id);
        _isMarks!.add(isMark!);
      }
      for(var major in _majors!){
        _majorNames!.add(major.name);
      }
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
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
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(

            icon: const Icon(

              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(() => const MainPage());
            },
          ),
          title: Text(
            _search ?? 'Most Popular Courses',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimension.font8),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  // method to show the search bar
                  _search = await showSearch<String?>(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate(),
                  );
                  if(_searchTerms.contains(_search)){
                    _courses = await CourseService().getCoursesByMajorName(_search);
                  } else {
                    _courses = await CourseService().getCoursesByName(_search);
                  }
                  setState(() {
                    if(_courses != null){
                      isLoaded = true;
                    }
                  });
                },
                icon: const Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                )),
          ],
          elevation: 0
      ),
      body: Column(
        children: [
          //show body
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                //list transaction
                Container(
                  width: 380,
                  height: 774,
                  margin: EdgeInsets.only(left: Dimension.width8, right: Dimension.width3),
                  padding: EdgeInsets.only(top: Dimension.height5),
                  child: Column(
                    children: [
                      Container(
                        width: 380,
                        height: 38,
                        child: ListView.builder(
                          itemCount: _majorNames!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () async {
                                if(_majorNames![index] == "All"){
                                  _courses = (await CourseService().getCourses())!;
                                  for(var course in _courses!){
                                    bool? isMark = await MarkService().checkMark(_menteeId, course.id);
                                    _isMarks!.add(isMark!);
                                  }
                                } else {
                                  _courses = await CourseService().getCoursesByMajorName(_majorNames![index]);
                                  for(var course in _courses!){
                                    bool? isMark = await MarkService().checkMark(_menteeId, course.id);
                                    _isMarks!.add(isMark!);
                                  }
                                }
                                  _majorIndex = index;
                                  setState(() {
                                    if(_courses != null){
                                      isLoaded = true;
                                    }
                                  });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Dimension.width5),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 142,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(
                                              color: Colors.blueAccent,
                                              style: BorderStyle.solid,
                                              width: 2.0
                                          ),
                                          color: _majorIndex != index ? Colors.white : Colors.blueAccent,
                                        ),
                                        child: Center(child: BigText(text: _majorNames![index], color: _majorIndex == index ? Colors.white : Colors.blueAccent, size: Dimension.font6, fontweight: FontWeight.w600,))
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: 380,
                        height: 688,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: Dimension.height5),
                            itemCount: _courses!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Get.to(() => VideoCourseDetails(id: _courses![index].id)),
                                child: Container(
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
                                            child: Image.network(_courses![index].image.toString()
                                              , fit: BoxFit.cover,),
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
                                                      child: Text(_courses![index].major!.name.toString(), style: TextStyle(color: Colors.white),),
                                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.mainColor,
                                                        border: Border.all(color: Colors.blue),
                                                        borderRadius: BorderRadius.circular(6),

                                                      ),
                                                    ),

                                                    _isMarks![index] ? Icon(Icons.bookmark, color: AppColors.mainColor, size: Dimension.font10,) : Icon(Icons.bookmark_border, color: AppColors.mainColor, size: Dimension.font10,)

                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  _courses![index].name.toString(),
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
                                                    text: '\$${_courses![index].price.toString()}',
                                                    style: TextStyle(
                                                      fontSize: Dimension.font6,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.blueAccent,
                                                    ),
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
                                    )),
                              );
                            }),
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
class CustomSearchDelegate extends SearchDelegate<String?> {
// Demo list to show querying
  List<String> searchTerms = [
    "Software Engineering",
    "Graphic Design",
    "International Business",
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return query != "" ? [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear, color: Colors.black,),
      ),
    ] : [
      IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.clear, color: Colors.black,),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back, color: Colors.black,),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var major in searchTerms) {
      if (major.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(major);
      }
    }
    matchQuery.add(query);
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return GestureDetector(
          onTap: (){
            query = result;
            close(context, result);
          },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var major in searchTerms) {
      if (major.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(major);
      }
    }
    matchQuery.add(query);
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        print(query);
        return GestureDetector(
          onTap: (){
            query = result;
            print(query);
            close(context, result);
          },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }
}
