import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/models/mark.dart';
import 'package:edu2gether_mobile/screens/checkout/choose_type_checkout.dart';
import 'package:edu2gether_mobile/screens/home_page/home_page.dart';
import 'package:edu2gether_mobile/screens/mentor/mentor_profile.dart';
import 'package:edu2gether_mobile/screens/most_popular_course/most_popular_courses.dart';
import 'package:edu2gether_mobile/screens/user_profile/paypal_payment.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
import 'package:edu2gether_mobile/services/course_service.dart';
import 'package:edu2gether_mobile/services/mark_service.dart';
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

  VideoCourseDetails({required this.id, Key? key}) : super(key: key);

  @override
  State<VideoCourseDetails> createState() => _VideoCourseDetailsState();
}

class _VideoCourseDetailsState extends State<VideoCourseDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;

  late VideoPlayerController _controller;

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/bumble_bee_captions.vtt');
    return WebVTTCaptionFile(
        fileContents); // For vtt files, use WebVTTCaptionFile
  }

  Course? _course;
  String? _menteeId;
  bool? _canEnroll;
  bool _isLoaded = false;
  bool? _isMark = false;

  @override
  void initState() {
    super.initState();

    _getData();
  }

  _getData() async {
    await AuthService().getUserLogin().then((value) async {
      _menteeId = value.id;
      _course = (await CourseService().getCoursesById(widget.id))!;
      _isMark = await MarkService().checkMark(_menteeId, _course!.id);
      _canEnroll = await CourseService().canEnroll(_menteeId, _course!.id);
      setState(() {
        if (_course != null) {
          _isLoaded = true;
          _controller = VideoPlayerController.network(
            _course!.videoUrl ??
                'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
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
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !_isLoaded
        ? const Scaffold(
            body: Center(
            child: CircularProgressIndicator(),
          ))
        : SingleChildScrollView(
            physics: ScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  maxHeight: MediaQuery.of(context).size.height + 300),
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: BackButton(
                    color: Colors.black,
                    onPressed: () {
                      Get.to(() => MainHomePage());
                    },
                  ),
                  backgroundColor: Colors.white,
                ),
                body: Column(
                  children: [
                    Expanded(
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
                                  ClosedCaption(
                                      text: _controller.value.caption.text),
                                  _ControlsOverlay(controller: _controller),
                                  VideoProgressIndicator(_controller,
                                      allowScrubbing: true),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: Dimension.height5,
                                    left: Dimension.width10,
                                    right: Dimension.width10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      _course!.name,
                                      //'Intro to UI/UX Design',
                                      style: TextStyle(
                                          fontFamily: 'Urbanist',
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                    GestureDetector(
                                        onTap: () async {
                                          Mark mark = Mark(
                                              courseId: _course!.id,
                                              menteeId: _menteeId!);
                                          await MarkService().markCourse(mark);
                                        },
                                        child: _isMark ?? true
                                            ? const Icon(Icons.bookmark,
                                                color: Colors.blueAccent)
                                            : const Icon(Icons.bookmark_border,
                                                color: Colors.blueAccent))
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimension.width10,
                                        right: Dimension.width15),
                                    child: Container(
                                      padding: const EdgeInsets.all(7),
                                      child: Text(
                                        _course!.major!.name,
                                        style: TextStyle(
                                            fontFamily: 'Urbanist',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.blueAccent),
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xD4F0FFFF),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 12,
                                        left: Dimension.width10,
                                        right: 12,
                                        bottom: 0),
                                    child: Text(
                                      _course!.price.toString() + " USD",
                                      style: TextStyle(
                                          fontFamily: 'Urbanist',
                                          fontSize: 32,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blueAccent),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.groups,
                                          color: Colors.blueAccent,
                                        ),
                                        SizedBox(
                                          width: Dimension.width3,
                                        ),
                                        Text(
                                          _course!.studentCount.toString() +
                                              ' Students',
                                          style: TextStyle(
                                              fontFamily: 'Urbanist',
                                              fontSize: Dimension.font6,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.schedule,
                                          color: Colors.blueAccent,
                                        ),
                                        SizedBox(
                                          width: Dimension.width3,
                                        ),
                                        Text(
                                          _course!.estimateHour.toString() +
                                              ' Hours',
                                          style: TextStyle(
                                              fontFamily: 'Urbanist',
                                              fontSize: Dimension.font6,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.description,
                                          color: Colors.blueAccent,
                                        ),
                                        SizedBox(
                                          width: Dimension.width3,
                                        ),
                                        Text(
                                          'Certificate',
                                          style: TextStyle(
                                              fontFamily: 'Urbanist',
                                              fontSize: Dimension.font6,
                                              color: Colors.black),
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
                            padding: EdgeInsets.only(
                                left: Dimension.width10,
                                right: Dimension.width10),
                            child: const Divider(),
                          ),
                          SizedBox(
                            height: Dimension.height3,
                          ),
                          BigText(
                            text: "About",
                            fontweight: FontWeight.bold,
                            size: Dimension.font10,
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimension.width10,
                                right: Dimension.width10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Dimension.height5,
                                ),
                                Text(
                                  "Mentor",
                                  style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      fontSize: Dimension.font8,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() =>
                                        MentorProfile(id: _course!.mentorId));
                                  },
                                  child: ListTile(
                                    title: BigText(
                                      text: _course!.mentor!.fullName,
                                      fontweight: FontWeight.bold,
                                      size: Dimension.font7,
                                    ),
                                    subtitle: BigText(
                                      text: _course!.mentor!.job,
                                      size: Dimension.font6,
                                    ),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(_course!.mentor!.image),
                                      radius: Dimension.height12,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Dimension.height5,
                                ),
                                Text(
                                  "About course",
                                  style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      fontSize: Dimension.font8,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: Dimension.height5,
                                ),
                                SmallText(
                                  text: _course!.detail.toString(),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
                floatingActionButton: Padding(
                  padding: EdgeInsets.only(
                      left: Dimension.width10,
                      right: Dimension.width10,
                      bottom: Dimension.height5),
                  child: SizedBox(
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      backgroundColor:
                          _canEnroll! ? Colors.blue : Colors.blueGrey,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        !_canEnroll!
                            ? null
                            : Get.to(() => ChooseTypeCheckout(id: widget.id));
                            // Get.to(() => PaypalPayment(
                            //       price: _course!.price,
                            //       menteeId: _menteeId!,
                            //       mentorId: _course!.mentorId,
                            //       courseId: _course!.id,
                            //     ));
                      },
                      label: Text(
                        'Enroll Course ' + _course!.price.toString() + "\$",
                        style: TextStyle(fontSize: Dimension.font10),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
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
            onSelected: (Duration _menteeId) {
              controller.setCaptionOffset(_menteeId);
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
