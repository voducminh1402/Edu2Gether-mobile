
import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/models/mentor.dart';
import 'package:edu2gether_mobile/screens/course_detail/video_course_details.dart';
import 'package:edu2gether_mobile/screens/mentor/top_mentor.dart';
import 'package:edu2gether_mobile/services/course_service.dart';
import 'package:edu2gether_mobile/services/mentor_service.dart';

import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    _getData();
  }

  _getData() async {
    _mentor = (await MentorService().getMentorById(widget.id));
    _course = (await CourseService().getCoursesByMentorId(widget.id));
    setState(() {
      if(_course != null && _mentor != null){
        isLoaded = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded ? Scaffold(body: const Center(child: CircularProgressIndicator(),)) :
      Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(

              icon: const Icon(

                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.to(() => const TopMentorPage());
              },
            ),
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {},

                  icon: const Icon(
                    Icons.more_horiz,
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
                      NetworkImage(_mentor!.image),
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
                          text: _course!.length.toString(),
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
                          text: _mentor!.studentNumber == null ? "0" : _mentor!.studentNumber.toString(),
                          size: Dimension.font8,
                          fontweight: FontWeight.bold,
                        ),
                        SmallText(
                          text: "Students",
                          size: Dimension.font5,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimension.height5,
                ),

                const Divider(),

                SizedBox(
                  height: Dimension.height3,
                ),
                BigText(text: "Course", fontweight: FontWeight.bold, size: Dimension.font8,),
                SizedBox(
                  height: Dimension.height3,
                ),
                const Divider(),
                Expanded(
                    child: ListView.builder(
                        padding:const  EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                        itemCount: _course?.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () => Get.to(() =>
                                VideoCourseDetails(
                                    id: _course![i].id)),
                            child: Container(
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

                                        child:Image.network(_course![i].image.toString(), fit: BoxFit.cover,) ,
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
                                              _course![i].estimateHour.toString()  + ' hours',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                  fontFamily: 'Urbanist'),
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
          ));
  }
}
