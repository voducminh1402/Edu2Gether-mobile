import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/models/mentor.dart';
import 'package:edu2gether_mobile/screens/blog/blog_post.dart';
import 'package:edu2gether_mobile/screens/course_detail/video_course_details.dart';
import 'package:edu2gether_mobile/screens/mentor/mentor_profile.dart';
import 'package:edu2gether_mobile/screens/mentor/top_mentor.dart';
import 'package:edu2gether_mobile/screens/most_popular_course/most_popular_courses.dart';
import 'package:edu2gether_mobile/screens/my_book_mark/my_book_mark.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
import 'package:edu2gether_mobile/services/course_service.dart';
import 'package:edu2gether_mobile/services/mentee_service.dart';
import 'package:edu2gether_mobile/services/mentor_service.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utilities/dimensions.dart';
import '../../widgets/big_text.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List<Course>? _courses;
  List<Mentor>? _mentors;
  Mentee? _mentee;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _courses = (await CourseService().getCourses())!;
    _mentors = (await MentorService().getMentor())!;
    await AuthService().getUserLogin().then((value) async {
      _mentee = await MenteeService().getMenteeById(value.id);
    });
    setState(() {
      if (_courses != null && _mentors != null && _mentee != null) {
        isLoaded = true;
      }
    });
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: Column(
              children: [
                //show header
                Container(
                  margin: EdgeInsets.only(
                    top: 45,
                  ),
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(_mentee!.image.toString()),
                                  foregroundColor: Colors.white,
                                  radius: Dimension.width10,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 16),
                                      child: Row(
                                        children: [
                                          SmallText(
                                            text: "Good " + greeting(),
                                            color: Colors.black,
                                            size: 12,
                                            fontweight: FontWeight.w200,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 7),
                                            child: Icon(
                                              Icons.waving_hand,
                                              color: Colors.black,
                                              size: 12,
                                            ),
                                          )
                                        ],
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 5, left: 16),
                                    child: BigText(
                                      text: _mentee!.fullName.toString(),
                                      color: Colors.black,
                                      size: 16,
                                      fontweight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Container(
                          //   width: 40,
                          //   height: 40,
                          //   child: Icon(
                          //     Icons.notifications_none,
                          //     color: Colors.blueAccent,
                          //     size: 30,
                          //   ),
                          // ),
                          GestureDetector(
                            onTap: () async {
                              Get.to(MyBookmarkPage(
                                id: _mentee!.id,
                              ));
                              // Payment? payment = await PaymentService.getPaymentById(_transaction![i].paymentId);
                              // print(payment!.id);
                              // Get.to(EReceiptPage(id: payment.id, transactionId: _transaction![i].id, menteeId: _transaction![i].walletId, walletId: _transaction![i].walletId.toString(),));
                            },
                            child: Container(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.bookmark,
                                  color: Colors.blueAccent,
                                  size: 30,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                //show body
                Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                    width: 380,
                    height: 882,
                    margin: EdgeInsets.only(left: 24, right: 24, top: 10),
                    child: Column(
                      children: [
                        Container(
                            width: 380,
                            height: 10,
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            )
                            ),
                        Container(
                          width: 380,
                          height: 160,
                          margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black12,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BlogPostPage()),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  child: BigText(
                                    text: "How to be a Dev?",
                                    color: Colors.black,
                                    size: 20,
                                    fontweight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  width: 380,
                                  height: 100,
                                  margin: EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Text(
                                    "Software developers use their programming skills to create new software and update existing applications. If you’re a creative thinker who enjoys problem solving, a career as a software developer could be a good fit. ",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(
                                      text: "Top Mentor",
                                      color: Colors.black,
                                      size: 16,
                                      fontweight: FontWeight.w600,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const TopMentorPage()),
                                          );
                                        },
                                        child: BigText(
                                          text: "See All",
                                          color: Colors.blue,
                                          size: 16,
                                          fontweight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                width: 380,
                                height: 120,
                                child: ListView.builder(
                                  itemCount: _mentors?.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () => Get.to(() => MentorProfile(
                                          id: _mentors![index].id)),
                                      child: Container(
                                        margin: EdgeInsets.only(right: 11),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                //
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  child: CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                            _mentors![index]
                                                                .image),
                                                    foregroundColor:
                                                        Colors.white,
                                                    radius: Dimension.width13,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    _mentors![index].fullName,
                                                    maxLines: 1,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                      fontFamily: 'Urbanist',
                                                      fontSize: 14,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
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
                          height: 512,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(
                                      text: "Most Popular Course",
                                      color: Colors.black,
                                      size: 16,
                                      fontweight: FontWeight.w600,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MostPopularCourse()),
                                          );
                                        },
                                        child: BigText(
                                          text: "See All",
                                          color: Colors.blue,
                                          size: 16,
                                          fontweight: FontWeight.w600,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                width: 380,
                                height: 493,
                                child: ListView.builder(
                                    //physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.symmetric(
                                        vertical: Dimension.height5),
                                    itemCount: _courses!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () => Get.to(
                                          () => VideoCourseDetails(
                                              id: _courses![index].id),
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.all(20),
                                            margin: EdgeInsets.only(
                                                top: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimension.radius12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(0,
                                                      2), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 110,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                    // Image border
                                                    child: SizedBox.fromSize(
                                                      size: Size.fromRadius(62),
                                                      // Image radius
                                                      child: Image.network(
                                                        _courses![index]
                                                            .image
                                                            .toString(),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Expanded(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            _courses![index]
                                                                .major!
                                                                .name
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 6,
                                                                  vertical: 3),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .mainColor,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .blue),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .local_fire_department,
                                                          color:
                                                              AppColors.fireRed,
                                                          size:
                                                              Dimension.font10,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      _courses![index].name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Urbanist'),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text.rich(
                                                      TextSpan(
                                                        text: '\$' +
                                                            _courses![index]
                                                                .price
                                                                .toString(),
                                                        style: TextStyle(
                                                          fontSize:
                                                              Dimension.font6,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.blueAccent,
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
                                                    SizedBox(
                                                      height: Dimension.height3,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          WidgetSpan(
                                                            child: Icon(
                                                                Icons.star,
                                                                size: Dimension
                                                                    .font5),
                                                          ),
                                                          WidgetSpan(
                                                            child: SizedBox(
                                                              width: Dimension
                                                                  .width3,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                              text: "4.7 | ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black38)),
                                                          TextSpan(
                                                              text: _courses![
                                                                          index]
                                                                      .estimateHour
                                                                      .toString() +
                                                                  " Hours",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black38)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                              ],
                                            )),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                    )
                ),
              ],
            ),
          );
  }
}
