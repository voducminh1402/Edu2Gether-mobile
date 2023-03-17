
import 'dart:convert';

import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/models/mentor.dart';
import 'package:edu2gether_mobile/screens/course_detail/video_course_details.dart';
import 'package:edu2gether_mobile/screens/mentor/mentor_detail.dart';
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
import 'package:get/get_connect/http/src/utils/utils.dart';
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

  List<dynamic>? _date;
  List<String> _dateOfWeek = ["T2", "T3", "T4", "T5", "T6", "T7", "CN"];

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
       _date  = json.decode(_mentor!.schedule!.replaceAll("'", "\""));
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
                      radius: Dimension.width28,
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
                          text: "150.000₫",
                          size: Dimension.font8,
                          fontweight: FontWeight.bold,
                        ),
                        SmallText(
                          text: "Buổi/Offline",
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
                          text: "100.000₫",
                          size: Dimension.font8,
                          fontweight: FontWeight.bold,
                        ),
                        SmallText(
                          text: "Buổi/Online",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
    ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: Size(380, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: AppColors.mainColor)
          ),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Urbanist')
      ),
      onPressed: () {
        Get.to(() => MentorDetail(id: widget.id));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.navigate_next_rounded, color: AppColors.mainColor,),
          Text(
            "Xem chi tiết",
            style: TextStyle(color: AppColors.mainColor),
          ),
        ],
      ),
    ),
                  ],
                ),
                SizedBox(
                  height: Dimension.height3,
                ),
                const Divider(),
                SizedBox(
                  height: Dimension.height3,
                ),
                Row(
                  children: [
                    BigText(text: "Schedule", fontweight: FontWeight.bold, size: Dimension.font8,),
                  ],
                ),
                SizedBox(
                  height: Dimension.height3,
                ),
                SizedBox(
                  //width: 3000,
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    
                    itemCount: _dateOfWeek.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 12),
                        height: 72,
                        width: 60,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: _date![index]["isActive"] ? AppColors.mainColor : Colors.white, border: Border.all(color: Colors.black12)),
                        
                        child: Center(child: Text(_dateOfWeek[index], style: TextStyle(fontWeight: FontWeight.bold, color:_date![index]["isActive"] ?  Colors.white: AppColors.mainColor, fontSize: Dimension.font10),)),
                      );
                    }
                  ),
                ),
                
                
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
