import 'package:edu2gether_mobile/models/mentor.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/mentor/mentor_profile.dart';
import 'package:edu2gether_mobile/services/mentor_service.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class TopMentorPage extends StatefulWidget {
  const TopMentorPage({Key? key}) : super(key: key);

  @override
  State<TopMentorPage> createState() => _TopMentorPageState();
}

class _TopMentorPageState extends State<TopMentorPage> {


  List<Mentor>? mentors;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();

    getData();
  }

  getData() async {
    mentors = (await MentorService().getMentor())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(mentors != null){
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded ? Scaffold(body: const Center(child: CircularProgressIndicator(),)) :
      Scaffold(
      body: Column(
        //show header
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
            padding: EdgeInsets.only(top: 9.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const MainPage());
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                      ),
                    ),
                    //BigText(text: "Top Mentor", color: Colors.black, size: 24, fontweight: FontWeight.w700,)
                    Text('Top Mentor', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),)

                  ],
                ),
                Container(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.search, color: Colors.black, size: 30,)
                ),
              ],
            ),
          ),
          //show body
          Expanded(child: SingleChildScrollView(
            child: Container(
              width: 380,
              height: 700,
              margin: EdgeInsets.only(left: 30, right: 24),
              child: ListView.builder(
                itemCount: mentors?.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: () => Get.to(() => MentorProfile(id: mentors![index].id)),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: Row(
                        children: [
                          Container(
                            width: 340,
                            height: 60,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: Dimension.width5),
                                  child: CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(mentors![index].image),
                                    foregroundColor: Colors.white,
                                    radius: Dimension.width15,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 60, left: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //BigText(text: "Jacob Kulikowsky", color: Colors.black, fontweight: FontWeight.w700, size: 18,),
                                      Text(mentors![index].fullName, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),),

                                      SizedBox(height: 4,),
                                      SmallText(text: mentors![index].job, color: Colors.black26,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
          ),
        ],
      ),
    );
  }
}
