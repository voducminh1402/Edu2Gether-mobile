import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/models/mentor.dart';
import 'package:edu2gether_mobile/screens/mentor/top_mentor.dart';
import 'package:edu2gether_mobile/screens/mostpopularcourse/most_popular_courses.dart';
import 'package:edu2gether_mobile/screens/mybookmark/mybookmark.dart';
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
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

    if(_courses != null && _mentors != null && _mentee != null){
      isLoaded = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return !isLoaded ? const Center(child: CircularProgressIndicator(),) :
    Scaffold(
      body: Column(
        children: [
          //show header
          Container(
              margin: EdgeInsets.only(top: 45, ),
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
                              backgroundImage: NetworkImage(_mentee!.image.toString()),
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
                                    SmallText(text: "Good Morning", color: Colors.black, size: 12, fontweight: FontWeight.w200,),
                                    Container(
                                      margin: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.waving_hand, color: Colors.black, size: 12,),
                                    )
                                  ],
                                )
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 16),
                                child: BigText(text: _mentee!.fullName.toString(), color: Colors.black, size: 16, fontweight: FontWeight.w700,),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: Icon(Icons.notifications_none, color: Colors.black, size: 30,),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Get.to(MyBookmarkPage(id: _mentee!.id,));
                          // Payment? payment = await PaymentService.getPaymentById(_transaction![i].paymentId);
                          // print(payment!.id);
                          // Get.to(EReceiptPage(id: payment.id, transactionId: _transaction![i].id, menteeId: _transaction![i].walletId, walletId: _transaction![i].walletId.toString(),));
                        },
                        child: Container(
                            width: 40,
                            height: 40,
                            child: Icon(Icons.bookmark_outline, color: Colors.black, size: 30,)
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          //show body
          Expanded(child: SingleChildScrollView(
            child: Container(
              width: 380,
              height: 700,
              margin: EdgeInsets.only(left: 24, right: 24, top: 10),
              child: Column(
                children: [
                  Container(
                    width: 380,
                    height: 20,
                    child: Text('__________________________________________________________________')
                    // TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     hintText: 'Search',
                    //   ),
                    // ),
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
                    height: 330,
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
                          height: 310,
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: Dimension.height5),
                              itemCount: _courses!.length,
                              itemBuilder: (context, index) {
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
                                            child: Image.network(_courses![index].image.toString())),
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
                                                      child: Text(_courses![index].major.name.toString(), style: TextStyle(color: Colors.white),),
                                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.mainColor,
                                                        border: Border.all(color: Colors.blue),
                                                        borderRadius: BorderRadius.circular(6),

                                                      ),
                                                    ),
                                                    Icon(Icons.local_fire_department, color: AppColors.fireRed, size: Dimension.font10,)
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  _courses![index].name,
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
                                                    text: '\$' + _courses![index].price.toString(),
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
                                                          text: _courses![index].estimateHour.toString() + " Hours", style: TextStyle(color: Colors.black38)
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
          )
          ),
        ],
      ),
    );
  }
}
