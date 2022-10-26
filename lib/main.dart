import 'package:edu2gether_mobile/course_detail/video_course_details.dart';
import 'package:edu2gether_mobile/routes/routes.dart';
import 'package:edu2gether_mobile/screens/booking/booking_slot.dart';


import 'package:edu2gether_mobile/screens/login/create_account.dart';
import 'package:edu2gether_mobile/screens/login/login.dart';
import 'package:edu2gether_mobile/screens/login/login_account.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/mostpopularcourse/mostpopularcourse.dart';

import 'package:edu2gether_mobile/screens/mostpopularcourse/review_details.dart';
import 'package:edu2gether_mobile/screens/my_course/my_home_page.dart';
import 'package:edu2gether_mobile/screens/mybookmark/mybookmark.dart';
import 'package:edu2gether_mobile/screens/nofitication/notification.dart';
import 'package:edu2gether_mobile/screens/payment_enroll/payment_enroll_course.dart';
import 'package:edu2gether_mobile/screens/payment_enroll/pin_enroll_course.dart';

import 'package:edu2gether_mobile/screens/transaction/ereceipt.dart';
import 'package:edu2gether_mobile/screens/transaction/transaction.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_edit.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_payment.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:edu2gether_mobile/screens/my_course/my_course.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      //highContrastDarkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: RoutesClass.getLoginRoute(),
      //home: AuthService().handleAuthState(),

      //home: AuthService().handleAuthState(),
      home: MainPage(),

      getPages: RoutesClass.routes,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.uid!,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              color: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: const Text(
                'LOG OUT',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                AuthService().signOut();
              },
            ),
          ],
        ),
      ),

    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home page'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 100,),
//             Text(FirebaseAuth.instance.currentUser!.email!, style: TextStyle(fontSize: 30),),
//             SizedBox(height: 30,),
//             MaterialButton(
//               padding: const EdgeInsets.all(10),
//               color: Colors.green,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//               child: const Text(
//                 'LOG OUT',
//                 style: TextStyle(color: Colors.white, fontSize: 15),
//               ),
//               onPressed: () {
//                 AuthService().signOut();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }