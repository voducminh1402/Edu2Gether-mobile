import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/screens/mostpopularcourse/most_popular_courses.dart';
import 'package:edu2gether_mobile/screens/user_profile/paypal_payment.dart';
import 'package:edu2gether_mobile/services/course_service.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimention_backup.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../models/mark.dart';
import '../../services/mark_service.dart';
import '../../utilities/dimensions.dart';


class VideoCourseDetails extends StatefulWidget {

  int id;
  String menteeID;

  VideoCourseDetails(
      {required this.id, required this.menteeID ,Key? key}) : super(key: key);

  @override
  State<VideoCourseDetails> createState() => _VideoCourseDetailsState();
}

class _VideoCourseDetailsState extends State<VideoCourseDetails> with TickerProviderStateMixin {

  late TabController _tabController;

  late VideoPlayerController _controller;

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/bumble_bee_captions.vtt');
    return WebVTTCaptionFile(
        fileContents); // For vtt files, use WebVTTCaptionFile
  }

  Course? _course;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      //closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _tabController = TabController(length: 3, vsync: this);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
    _getData();
  }

  _getData() async {
    _course = (await CourseService().getCoursesById(widget.id))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

    if(_course != null){
      _isLoaded = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !_isLoaded ? const Scaffold(body: Center(child: CircularProgressIndicator(),)) :
    SingleChildScrollView(
      physics: ScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            maxHeight: MediaQuery.of(context).size.height + 20
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
              onPressed: (){
                Get.to(() => const MostPopularCourse());
              },
            ),
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [
              DefaultTabController(
                  length: 2,
                  child: Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 250,
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(0),
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                VideoPlayer(_controller),
                                ClosedCaption(text: _controller.value.caption.text),
                                _ControlsOverlay(controller: _controller),
                                VideoProgressIndicator(_controller, allowScrubbing: true),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: Dimension.height5, left: Dimension.width10, right: Dimension.width10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    _course!.name,
                                    //'Intro to UI/UX Design',
                                    style: TextStyle(fontFamily: 'Urbanist', fontSize: 28, fontWeight: FontWeight.w700,color: Colors.black),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Mark mark = Mark(courseId: widget.id, menteeID: widget.menteeID);
                                      MarkService().markACourse(mark);
                                    },
                                    icon: Icon(Icons.bookmark_outline, color: AppColors.mainColor, size: Dimension.font10,),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width15),
                                  child: Container(
                                    padding: const EdgeInsets.all(7),
                                    child: Text(
                                      _course!.major!.name,
                                      style: TextStyle(fontFamily: 'Urbanist', fontSize: 10, fontWeight: FontWeight.w700,color: Colors.blueAccent),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xD4F0FFFF),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                                Icon(Icons.star_half, color: Colors.amberAccent,),
                                Text(
                                  '4.8 (4,479 reviews)',
                                  style: TextStyle(fontFamily: 'Urbanist', fontSize: 16, fontWeight: FontWeight.w700,color: Colors.black),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 12,left: Dimension.width10,right: 12,bottom: 0),
                                  child: Text(
                                    _course!.price.toString() + " USD",
                                    style: TextStyle(fontFamily: 'Urbanist', fontSize: 32, fontWeight: FontWeight.w700,color: Colors.blueAccent),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.groups,color: Colors.blueAccent,),
                                      SizedBox(width: Dimension.width3,),
                                      Text(
                                        '9,839 Students',
                                        style: TextStyle(fontFamily: 'Urbanist', fontSize: Dimension.font6, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.schedule,color: Colors.blueAccent,),
                                      SizedBox(width: Dimension.width3,),
                                      Text(
                                        _course!.estimateHour.toString() + ' Hours',
                                        style: TextStyle(fontFamily: 'Urbanist', fontSize: Dimension.font6, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.description,color: Colors.blueAccent,),
                                      SizedBox(width: Dimension.width3,),
                                      Text(
                                        'Certificate',
                                        style: TextStyle(fontFamily: 'Urbanist', fontSize: Dimension.font6, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimension.height3,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
                          child: const Divider(),
                        ),
                        SizedBox(
                          height: Dimension.height3,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
                          child: TabBar(
                            indicatorColor: Colors.blue,
                            labelColor: Colors.blue,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: Dimension.font6),
                            unselectedLabelColor: Colors.grey,
                            unselectedLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: Dimension.font6),
                            tabs: [
                              Tab(text: 'About'),
                              Tab(text: 'Reviews'),
                            ],
                          ),
                        ),
                        Expanded(child: Padding(
                          padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
                          child: TabBarView(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Dimension.height5,
                                  ),
                                  Text(
                                    "Mentor",
                                    style: TextStyle(fontFamily: 'Urbanist', fontSize: Dimension.font8, fontWeight: FontWeight.w700,color: Colors.black),
                                  ),
                                  ListTile(
                                    title: BigText(text: _course!.mentor!.fullName, fontweight: FontWeight.bold, size: Dimension.font7,),
                                    subtitle: BigText(text: _course!.mentor!.job, size: Dimension.font6,),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                      NetworkImage(_course!.mentor!.image),
                                      radius: Dimension.height12,
                                    ),
                                    trailing: const Icon(Icons.more_horiz_rounded),
                                  ),
                                  SizedBox(
                                    height: Dimension.height5,
                                  ),
                                  Text(
                                    "About course",
                                    style: TextStyle(fontFamily: 'Urbanist', fontSize: Dimension.font8, fontWeight: FontWeight.w700,color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: Dimension.height5,
                                  ),
                                  SmallText(text: _course!.detail.toString(),)
                                ],
                              ),
                              ListView.builder(
                                  padding: EdgeInsets.symmetric(vertical: Dimension.height5, horizontal: Dimension.width5),
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
                          ),
                        )),
                      ],
                    ),
                  )
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10, bottom: Dimension.height5),
            child: SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                onPressed: () {
                  Get.to(() => PaypalPayment(price: _course!.price,));
                },
                label: Text('Enroll Course ' + _course!.price.toString(), style: TextStyle(
                    fontSize: Dimension.font10
                ),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
      MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Get.to(() => const MostPopularCourse());
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            DefaultTabController(
            length: 2,
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 250,
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.all(0),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          VideoPlayer(_controller),
                          ClosedCaption(text: _controller.value.caption.text),
                          _ControlsOverlay(controller: _controller),
                          VideoProgressIndicator(_controller, allowScrubbing: true),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: Dimension.height5, left: Dimension.width10, right: Dimension.width10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  _course!.name,
                                  //'Intro to UI/UX Design',
                                  style: TextStyle(fontFamily: 'Urbanist', fontSize: 28, fontWeight: FontWeight.w700,color: Colors.black),
                                ),
                              Icon(Icons.bookmark,color: Colors.blueAccent)
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width15),
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                child: Text(
                                  _course!.major!.name,
                                  style: TextStyle(fontFamily: 'Urbanist', fontSize: 10, fontWeight: FontWeight.w700,color: Colors.blueAccent),
                                ),
                                decoration: BoxDecoration(
                                    color: const Color(0xD4F0FFFF),
                                    borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                            Icon(Icons.star_half, color: Colors.amberAccent,),
                            Text(
                              '4.8 (4,479 reviews)',
                              style: TextStyle(fontFamily: 'Urbanist', fontSize: 16, fontWeight: FontWeight.w700,color: Colors.black),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12,left: Dimension.width10,right: 12,bottom: 0),
                              child: Text(
                                _course!.price.toString() + " USD",
                                style: TextStyle(fontFamily: 'Urbanist', fontSize: 32, fontWeight: FontWeight.w700,color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.groups,color: Colors.blueAccent,),
                                  SizedBox(width: Dimension.width3,),
                                  Text(
                                    '9,839 Students',
                                    style: TextStyle(fontFamily: 'Urbanist', fontSize: Dimension.font6, color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.schedule,color: Colors.blueAccent,),
                                  SizedBox(width: Dimension.width3,),
                                  Text(
                                    _course!.estimateHour.toString() + ' Hours',
                                    style: TextStyle(fontFamily: 'Urbanist', fontSize: Dimension.font6, color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.description,color: Colors.blueAccent,),
                                  SizedBox(width: Dimension.width3,),
                                  Text(
                                    'Certificate',
                                    style: TextStyle(fontFamily: 'Urbanist', fontSize: Dimension.font6, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
                    child: const Divider(),
                  ),
                  SizedBox(
                    height: Dimension.height3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
                    child: TabBar(
                      indicatorColor: Colors.blue,
                      labelColor: Colors.blue,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Dimension.font6),
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Dimension.font6),
                      tabs: [
                        Tab(text: 'About'),
                        Tab(text: 'Reviews'),
                      ],
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
                    child: TabBarView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Dimension.height5,
                            ),
                            Text(
                              "Mentor",
                              style: TextStyle(fontFamily: 'Urbanist', fontSize: Dimension.font8, fontWeight: FontWeight.w700,color: Colors.black),
                            ),
                            ListTile(
                              title: BigText(text: _course!.mentor!.fullName, fontweight: FontWeight.bold, size: Dimension.font7,),
                              subtitle: BigText(text: _course!.mentor!.job, size: Dimension.font6,),
                              leading: CircleAvatar(
                                backgroundImage:
                                NetworkImage(_course!.mentor!.image),
                                radius: Dimension.height12,
                              ),
                              trailing: const Icon(Icons.more_horiz_rounded),
                            ),
                            SizedBox(
                              height: Dimension.height5,
                            ),
                            Text(
                              "About course",
                              style: TextStyle(fontFamily: 'Urbanist', fontSize: Dimension.font8, fontWeight: FontWeight.w700,color: Colors.black),
                            ),
                            SizedBox(
                              height: Dimension.height5,
                            ),
                            SmallText(text: _course!.detail.toString(),)
                          ],
                        ),
                        ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: Dimension.height5, horizontal: Dimension.width5),
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
                    ),
                  ))
                ],
              ),
            )
        )
          ],
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
