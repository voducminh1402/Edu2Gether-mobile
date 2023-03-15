import 'package:edu2gether_mobile/models/mark.dart';
import 'package:edu2gether_mobile/screens/course_detail/video_course_details.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
import 'package:edu2gether_mobile/services/mark_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/course.dart';
import '../../services/course_service.dart';
import '../../utilities/colors.dart';
import '../../utilities/dimensions.dart';
import '../main_page/main_page.dart';

class MyBookmarkPage extends StatefulWidget {
  String? id;
  MyBookmarkPage({this.id,Key? key}) : super(key: key);

  @override
  State<MyBookmarkPage> createState() => _MyBookmarkPageState();
}

class _MyBookmarkPageState extends State<MyBookmarkPage> {
  final Set<Major> _searchTerms = Set<Major>();
  final Set<String> _majorNames = Set<String>();
  late List<Course>? _courses;
  String? _menteeId;
  String? _search;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    await AuthService().getUserLogin().then((value) async {
      _menteeId = value.id;
      _courses = (await CourseService().getBookmarkByUserId(value.id))!;
      if(_courses != null){
        return _courses;
      }
      setState(() {
        if(_courses != null ){
          isLoaded = true;
        }
      });
    });
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
              Get.to(() => MainPage());
            },
          ),
          title: Text(
              _search ?? 'My Bookmark',
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
                      delegate: CustomSearchDelegate(_searchTerms),
                  );
                  if(_majorNames.contains(_search)){
                    int id = _searchTerms.firstWhere((element) => element.name == _search).id;
                    _courses = await CourseService().getBookmarkByUserIdWithMajorId(_menteeId, id);
                  } else {
                    _courses = await CourseService().getBookmarkByUserIdWithSearchString(_menteeId, _search);
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
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: Dimension.height5),
          itemCount: _courses!.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () => Get.to(() =>
                  VideoCourseDetails(
                      id: _courses![i].id)),
              child: Container(
                  padding: EdgeInsets.all(Dimension.height8),
                  margin: EdgeInsets.all(Dimension.height8),
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
                          size: Size.fromRadius(52), // Image radius
                          child: Image.network(_courses![i].image.toString(),
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
                                    child: Text("Marked", style: TextStyle(color: Colors.white),),
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(6),

                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        Mark mark = Mark(courseId: _courses![i].id, menteeId: _menteeId!);
                                        await MarkService().unMarkCourse(mark);
                                        _courses = await CourseService().getBookmarkByUserId(_menteeId);
                                        setState(() {
                                          if(_courses != null){
                                            isLoaded = true;
                                          }
                                        });
                                      },
                                      child: Icon(Icons.bookmark, color: AppColors.mainColor, size: Dimension.font10,))
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
                                    fontSize: Dimension.font9,
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
                                ),
                              ),
                            ],
                          ))
                    ],
                  )),
            );
          }),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate<String?> {
// Demo list to show querying
  Set<Major>? searchTerms;

  CustomSearchDelegate(Set<Major> searchTerms){
    this.searchTerms = searchTerms;
  }

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
    for (var major in searchTerms!) {
      if (major.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(major.name);
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
    for (var major in searchTerms!) {
      if (major.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(major.name);
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

