import 'package:edu2gether_mobile/services/mentor_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/mentor.dart';
import '../../utilities/dimensions.dart';
import '../../widgets/small_text.dart';

class TopMentorBody extends StatefulWidget {
  const TopMentorBody({Key? key}) : super(key: key);

  @override
  State<TopMentorBody> createState() => _TopMentorBodyState();
}

class _TopMentorBodyState extends State<TopMentorBody> {

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
    return Column(
      children: [
        //list transaction
        Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Container(
            width: 380,
            height: 700,
            margin: EdgeInsets.only(left: 30, right: 24),
            child: ListView.builder(
              itemCount: mentors?.length,
              itemBuilder: (context, index){
                return Container(
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
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
