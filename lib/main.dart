import 'dart:io';

import 'package:edu2gether_mobile/routes/routes.dart';
import 'package:edu2gether_mobile/screens/blog/blog.dart';
import 'package:edu2gether_mobile/screens/booking/booking_slot.dart';
import 'package:edu2gether_mobile/screens/course_detail/video_course_details.dart';
import 'package:edu2gether_mobile/screens/home_page/home_page.dart';
import 'package:edu2gether_mobile/screens/mentor/mentor_detail.dart';
import 'package:edu2gether_mobile/screens/mentor/top_mentor.dart';
import 'package:edu2gether_mobile/screens/most_popular_course/most_popular_courses.dart';
import 'package:edu2gether_mobile/screens/splash_screen/splash_screen.dart';


import 'package:edu2gether_mobile/services/auth_service.dart';


import 'package:edu2gether_mobile/services/auth_service.dart';

import 'package:edu2gether_mobile/screens/login/create_account.dart';
import 'package:edu2gether_mobile/screens/login/login.dart';
import 'package:edu2gether_mobile/screens/login/login_account.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/mentor/mentor_profile.dart';



import 'package:edu2gether_mobile/screens/nofitication/notification.dart';
import 'package:edu2gether_mobile/screens/payment_enroll/payment_enroll_course.dart';
import 'package:edu2gether_mobile/screens/payment_enroll/pin_enroll_course.dart';

import 'package:edu2gether_mobile/screens/transaction/ereceipt.dart';
import 'package:edu2gether_mobile/screens/transaction/transaction.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_edit.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_payment.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:edu2gether_mobile/screens/my_course/my_course.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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


      // home: AuthService().handleAuthState(),

      //home: MentorProfile(id: "1",),
      //home: VideoCourseDetails(id: 4),
      //home: EReceiptPage(id: "gGqJe6eNhXdxMm4ex9n5hfvVIjv1", transactionId: , walletId: ,),
      home: MainHomePage(),
// home: MentorProfile(id: "1",),
//  home: MentorDetail(id: "1"),

      getPages: RoutesClass.routes,
    );
  }
}
