
import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/models/mentor.dart';
import 'package:edu2gether_mobile/services/course_service.dart';
import 'package:edu2gether_mobile/services/mentor_service.dart';

import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';

class MentorProfile extends StatefulWidget {


  String id;


  MentorProfile({required this.id, Key? key}) : super(key: key);


  @override
  State<MentorProfile> createState() => _MentorProfileState();
}

class _MentorProfileState extends State<MentorProfile> {


  List<Course>? _course;

  Mentor? _mentor;

  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    _getMentorById();
    _getCourseByMentorId();
  }

  _getMentorById() async{
    _mentor = (await MentorService().getMentorById(_mentor?.id ?? 0));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_mentor != null){
      isLoaded = true;
    }
  }

  _getCourseByMentorId() async{
    _course = (await CourseService().getCoursesByMentorId(_mentor?.id ?? 0));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_course != null){
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(

              icon: const Icon(

                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                //Get.toNamed(RoutesClass.getLoginRoute());
                //Navigator.pop(context);
              },
            ),
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {},

                  icon: const Icon(
                    Icons.more,
                    color: Colors.black,
                  )),
              const SizedBox(

                width: 12,
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimension.width5),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height20, bottom: Dimension.height5),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage:
                          const ExactAssetImage("assets/images/mentor.png"),
                      foregroundColor: Colors.white,
                      radius: Dimension.width24,
                    ),
                  ),
                ),
                BigText(

                  text: _mentor?.fullName ?? '',

                  size: Dimension.font8,
                  fontweight: FontWeight.bold,
                ),
                SizedBox(
                  height: Dimension.height3,
                ),
                SmallText(

                  text: _mentor?.job ?? '',

                  size: Dimension.font6,
                ),
                SizedBox(
                  height: Dimension.height5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(
                          text: "25",
                          size: Dimension.font8,
                          fontweight: FontWeight.bold,
                        ),
                        SmallText(
                          text: "Courses",
                          size: Dimension.font5,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: Dimension.height16,
                      child: const VerticalDivider(

                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(
                          text: "22,379",
                          size: Dimension.font8,
                          fontweight: FontWeight.bold,
                        ),
                        SmallText(
                          text: "Students",
                          size: Dimension.font5,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: Dimension.height16,
                      child: const VerticalDivider(

                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(
                          text: "9,287",
                          size: Dimension.font8,
                          fontweight: FontWeight.bold,
                        ),
                        SmallText(
                          text: "Reviews",
                          size: Dimension.font5,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimension.height5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Respond to button press
                      },

                      icon: const Icon(Icons.message),
                      label: const Text("Message"),

                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimension.radius16)),
                          ),
                          minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width / 2.3, 46),
                          ),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: Dimension.font5,
                              fontWeight: FontWeight.bold)),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.mainColor)),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        // Respond to button press
                      },

                      icon: const Icon(Icons.web),
                      label: const Text("Website"),

                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimension.radius16)),
                          ),
                          minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width / 2.3, 46),
                          ),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: Dimension.font5,
                              fontWeight: FontWeight.bold)),
                          side: MaterialStateProperty.all(
                              BorderSide(color: AppColors.mainColor, width: 2)),
                          foregroundColor:
                              MaterialStateProperty.all(AppColors.mainColor)),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimension.height3,
                ),

                const Divider(),

                SizedBox(
                  height: Dimension.height3,
                ),
                TabBar(
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Dimension.font6),
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Dimension.font6),

                  tabs: const [

                    Tab(text: 'Courses'),
                    Tab(text: 'Students'),
                    Tab(text: 'Reviews'),
                  ],
                ),
                Expanded(child: TabBarView(
                  children: [
                    ListView.builder(

                        padding:const  EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                        itemCount: _course?.length,
                        itemBuilder: (context, i) {
                          return Container(
                              padding:const EdgeInsets.all(20),
                              margin: const EdgeInsets.symmetric(vertical: 10),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(Dimension.radius12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 2,

                                    offset:const Offset(0, 2), // changes position of shadow

                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    // Image border
                                    child: SizedBox.fromSize(

                                      size: const Size.fromRadius(48), // Image radius

                                      child: Image.asset('assets/images/course.png',
                                          fit: BoxFit.cover),
                                    ),
                                  ),

                                  const SizedBox(

                                    width: 15,
                                  ),
                                  Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text(
                                            _course?[i].name ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style:const TextStyle(


                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Urbanist'),
                                          ),

                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            _course![i].estimateHour.toString() + ' hours',
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                                fontFamily: 'Urbanist'),
                                          ),
                                          const SizedBox(
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
                        padding: EdgeInsets.symmetric(vertical: Dimension.height5),
                        itemCount: 6,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: Dimension.height3),
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: BigText(text: 'Benny Spanbauer', fontweight: FontWeight.bold,),
                              ),
                              subtitle: SmallText(text: "Students", size: Dimension.font5, color: Colors.black38,),
                              leading: CircleAvatar(
                                backgroundImage:
                                const ExactAssetImage("assets/images/mentor.png"),
                                radius: Dimension.width10,
                              ),
                              trailing: Icon(Icons.label, size: Dimension.font10, color: AppColors.mainColor,)
                            ),
                          );
                        }),
                    ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: Dimension.height5),
                        itemCount: 6,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: EdgeInsets.only(bottom: Dimension.height5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                          const ExactAssetImage("assets/images/mentor.png"),
                                          radius: Dimension.height8,
                                        ),
                                        SizedBox(width: Dimension.width5,),
                                        BigText(text: "Francene Vandyne", fontweight: FontWeight.bold,),
                                      ],
                                    )),
                                    Row(
                                      children: [
                                        Container(

                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.mainColor, width: 2),
                                            borderRadius: BorderRadius.circular(Dimension.radius16),

                                          ),

                                          child: Row(
                                            children: [
                                              Icon(Icons.star, size: 14, color: AppColors.mainColor,),
                                              SizedBox(width: Dimension.width3,),
                                              Text("5", style: TextStyle(color: AppColors.mainColor),),
                                            ],
                                          ),

                                        ),
                                        SizedBox(width: Dimension.width5,),
                                        const Icon(Icons.more)

                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: Dimension.height3,),
                                SmallText(text: "The course is very good. The explanation of the mentor is very clear and easy to understand!", size: Dimension.font5, color: Colors.black54,),
                                SizedBox(height: Dimension.height3,),
                                Row(
                                  children: [
                                    Row(
                                      children: [

                                        const Icon(Icons.heart_broken, size: 20,),

                                        SizedBox(width: Dimension.width5,),
                                        SmallText(text: "369", size: Dimension.font5, color: Colors.black54, fontweight: FontWeight.bold,),
                                      ],
                                    ),
                                    SizedBox(width: Dimension.width10,),
                                    Expanded(
                                      child: SmallText(text: "3 weeks ago", size: 14, color: Colors.black38,),

                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
