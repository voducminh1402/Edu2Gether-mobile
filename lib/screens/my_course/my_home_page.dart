import 'package:edu2gether_mobile/services/course_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';


import '../../models/course.dart';
import '../../utilities/dimensions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Course>? _courses = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _courses = (await CourseService().getCourses())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(
              'My Courses',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimension.font8),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.black,
                  )),
            ],
            elevation: 0,
            bottom: TabBar(
              padding: EdgeInsets.only(
                  top: Dimension.height5,
                  left: Dimension.width10,
                  right: Dimension.width10),
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Dimension.font6),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Dimension.font6),
              tabs: [
                Tab(text: 'Ongoing'),
                Tab(text: 'Completed'),
              ],
            ),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: _courses == null || _courses!.isEmpty
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Container(
            color: Colors.white10,
            padding: EdgeInsets.only(
              left: Dimension.width10,
              right: Dimension.width10,
              top: Dimension.height5,
            ),
            child: TabBarView(
              children: [
                ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
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
                                  size: Size.fromRadius(48), // Image radius
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
                                      Text(
                                        _courses![i].estimateHour.toString() + ' hours',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontFamily: 'Urbanist'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GFProgressBar(
                                        percentage: 0.7,
                                        lineHeight: 5,
                                        alignment: MainAxisAlignment.spaceBetween,
                                        trailing: const Text(
                                          '70/100',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                        backgroundColor: Colors.black12,
                                        progressBarColor: Colors.blue,
                                      )
                                    ],
                                  ))
                            ],
                          ));
                    }),
                ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
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
                                  size: Size.fromRadius(48), // Image radius
                                  child: Image.asset('assets/images/course.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '3D Design Illustration',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '3 hrs 20 mins',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontFamily: 'Urbanist'),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: GFProgressBar(
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    percentage: 0.9,
                                    width: 200,
                                    radius: 75,
                                    circleWidth: 8,
                                    lineHeight: 30,
                                    type: GFProgressType.circular,
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 5, left: 5),
                                      child: Text('90%', textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    backgroundColor: Colors.black26,
                                    progressBarColor: GFColors.DANGER),
                              )
                            ],
                          ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
