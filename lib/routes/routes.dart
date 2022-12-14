

import 'package:edu2gether_mobile/main.dart';
import 'package:edu2gether_mobile/screens/course_detail/video_course_details.dart';
import 'package:edu2gether_mobile/screens/login/create_account.dart';
import 'package:edu2gether_mobile/screens/login/login.dart';
import 'package:edu2gether_mobile/screens/login/login_account.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/nofitication/notification.dart';


import 'package:edu2gether_mobile/screens/payment_enroll/payment_enroll_course.dart';
import 'package:edu2gether_mobile/screens/payment_enroll/pin_enroll_course.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_edit.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_payment.dart';
import 'package:get/get.dart';
class RoutesClass{
  static String home = "/";
  static String loginAccount = "/loginAccount";
  static String createAccount = "/createAccount";
  static String login = "/login";
  static String profile = "/profile";
  static String profileEdit = "/profileEdit";
  static String profilePayment = "/profilePayment";
  static String paymentEnrollCourse = "/enrollCoursePayment";
  static String pinEnrollCourse = "/enrollCoursePin";
  static String getNotification = "/getNotification";
  static String videoCourseDetail = "/getCourseDetail";

  //static String getNotification = "/getNotification";


  static String getHomeRoute() => home;
  static String getLoginAccountRoute() => loginAccount;
  static String getCreateAccountRoute() => createAccount;
  static String getLoginRoute() => login;
  static String getProfileRoute() => profile;
  static String getProfileEditRoute() => profileEdit;
  static String getProfilePaymentRoute() => profilePayment;
  static String getPaymentEnrollCourseRoute() => paymentEnrollCourse;
  static String getPinEnrollCourseRoute() => pinEnrollCourse;
  static String getNotificationRoute() => getNotification;
  static String getVideoCourseDetail(id) => videoCourseDetail;

  //static String getNotificationRoute() => getNotification;


  static List<GetPage> routes = [
    GetPage(name: home, page: () => const MainPage()),
    GetPage(name: loginAccount, page: () => const LoginAccount()),
    GetPage(name: createAccount, page: () => const CreateAccount()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: profile, page: () =>  Profile(id: '',)),
    GetPage(name: profileEdit, page: () =>  ProfileEdit(id: '',)),
    GetPage(name: profilePayment, page: () => const ProfilePayment()),
    GetPage(name: paymentEnrollCourse, page: () => const PaymentEnrollCourse()),
    GetPage(name: pinEnrollCourse, page: () => PinEnrollCourse()),
    GetPage(name: getNotification, page: () => NofiticationPage()),

    //GetPage(name: videoCourseDetail, page: (id) => VideoCourseDetails(id: id)),

  ];
}