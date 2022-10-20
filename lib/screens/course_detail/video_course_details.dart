
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimention_backup.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../utilities/dimensions.dart';


class VideoCourseDetails extends StatefulWidget {
  const VideoCourseDetails({Key? key}) : super(key: key);

  @override
  State<VideoCourseDetails> createState() => _VideoCourseDetailsState();
}

class _VideoCourseDetailsState extends State<VideoCourseDetails> with TickerProviderStateMixin {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: (){

            },
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            _BumbleBeeRemoteVideo(),
          ],
        ),
      ),
    );
  }
}

class _BumbleBeeRemoteVideo extends StatefulWidget {
  @override
  _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
}

class _BumbleBeeRemoteVideoState extends State<_BumbleBeeRemoteVideo> with TickerProviderStateMixin {

  late TabController _tabController;

  late VideoPlayerController _controller;

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/bumble_bee_captions.vtt');
    return WebVTTCaptionFile(
        fileContents); // For vtt files, use WebVTTCaptionFile
  }

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 50,top: 24,bottom: 10),
                        child: Text(
                          'Intro to UI/UX Design',
                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 28, fontWeight: FontWeight.w700,color: Colors.black),
                        ),
                      ),
                      Icon(Icons.bookmark,color: Colors.blueAccent)
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24,right: 12),
                        child: Container(
                          child: Text(
                            'UI/UX Design',
                            style: TextStyle(fontFamily: 'Urbanist', fontSize: 10, fontWeight: FontWeight.w700,color: Colors.blueAccent),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(6), boxShadow: [BoxShadow(blurRadius: 50,color: Colors.black,)] // Make rounded corner of border
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
                        padding: const EdgeInsets.only(top: 12,left: 24,right: 12,bottom: 0),
                        child: Text(
                          '40 VND',
                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 32, fontWeight: FontWeight.w700,color: Colors.blueAccent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Text(
                          '75 VND',
                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 20, fontWeight: FontWeight.w700,color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24,right: 3),
                          child: Icon(Icons.groups,color: Colors.blueAccent,),
                        ),
                        Text(
                          '9,839 Students',
                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 16, fontWeight: FontWeight.w700,color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 3),
                          child: Icon(Icons.schedule,color: Colors.blueAccent,),
                        ),
                        Text(
                          '2.5 Hours',
                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 16, fontWeight: FontWeight.w700,color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 3),
                          child: Icon(Icons.description,color: Colors.blueAccent,),
                        ),
                        Text(
                          'Certificate',
                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 16, fontWeight: FontWeight.w700,color: Colors.black),
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
                              const ExactAssetImage("assets/images/mentor.png"),
                              radius: Dimension.width10,
                            ),
                            trailing: Icon(Icons.label, size: Dimension.font10, color: AppColors.mainColor,)
                        ),
                      );
                    }),
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
            ))
          ],
        ),
      )
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

