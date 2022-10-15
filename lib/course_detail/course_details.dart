//
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class CourseDetail extends StatefulWidget {
//   const CourseDetail({Key? key}) : super(key: key);
//
//   @override
//   State<CourseDetail> createState() => _CourseDetailState();
// }
//
// class _CourseDetailState extends State<CourseDetail> {
//
//   late YoutubePlayerController controller;
//
//   @override
//   void initState(){
//     super.initState();
//     const url = 'https://www.youtube.com/watch?v=CHw1b_1LVBA&list=RDMMCHw1b_1LVBA&start_radio=1';
//
//     controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(url)!,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) => YoutubePlayerBuilder(
//       player: YoutubePlayer(controller: controller,),
//       builder: (context,player) => Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               //Navigator.pop(context);
//             },
//           ),
//           elevation: 0,
//         ),
//         body: ListView(),
//       )
//   );
// }
