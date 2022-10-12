import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MentorProfile extends StatefulWidget {
  const MentorProfile({Key? key}) : super(key: key);

  @override
  State<MentorProfile> createState() => _MentorProfileState();
}

class _MentorProfileState extends State<MentorProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
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
                  icon: Icon(
                    Icons.more,
                    color: Colors.black,
                  )),
              SizedBox(
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
                          const ExactAssetImage("assets/image/mentor.png"),
                      foregroundColor: Colors.white,
                      radius: Dimension.width24,
                    ),
                  ),
                ),
                BigText(
                  text: "Joathan Williams",
                  size: Dimension.font8,
                  fontweight: FontWeight.bold,
                ),
                SizedBox(
                  height: Dimension.height3,
                ),
                SmallText(
                  text: "Senior UI/UX Designer at Google",
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
                    Container(
                      height: Dimension.height16,
                      child: VerticalDivider(
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
                    Container(
                      height: Dimension.height16,
                      child: VerticalDivider(
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
                      icon: Icon(Icons.message),
                      label: Text("Message"),
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
                      icon: Icon(Icons.web),
                      label: Text("Website"),
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
                Divider(),
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
                  tabs: [
                    Tab(text: 'Courses'),
                    Tab(text: 'Students'),
                    Tab(text: 'Reviews'),
                  ],
                ),
                Expanded(child: TabBarView(
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: Dimension.height5),
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
                                      size: Size.fromRadius(62), // Image radius
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
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text("3D Design", style: TextStyle(color: Colors.white),),
                                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                                decoration: BoxDecoration(
                                                  color: AppColors.mainColor,
                                                  border: Border.all(color: Colors.blue),
                                                  borderRadius: BorderRadius.circular(6),

                                                ),
                                              ),
                                              Icon(Icons.bookmark, color: AppColors.mainColor, size: Dimension.font10,)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '3D Design Illustration',
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
                                              text: '\$48',
                                              style: TextStyle(
                                                fontSize: Dimension.font6,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueAccent,
                                              ), // default text style
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' \$80',
                                                  style: TextStyle(
                                                    fontSize: Dimension.font5,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                              ],
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
                                const ExactAssetImage("assets/image/mentor.png"),
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
                                          const ExactAssetImage("assets/image/mentor.png"),
                                          radius: Dimension.height8,
                                        ),
                                        SizedBox(width: Dimension.width5,),
                                        BigText(text: "Francene Vandyne", fontweight: FontWeight.bold,),
                                      ],
                                    )),
                                    Row(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(Icons.star, size: 14, color: AppColors.mainColor,),
                                              SizedBox(width: Dimension.width3,),
                                              Text("5", style: TextStyle(color: AppColors.mainColor),),
                                            ],
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.mainColor, width: 2),
                                            borderRadius: BorderRadius.circular(Dimension.radius16),

                                          ),
                                        ),
                                        SizedBox(width: Dimension.width5,),
                                        Icon(Icons.more)
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
                                        Icon(Icons.heart_broken, size: 20,),
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
