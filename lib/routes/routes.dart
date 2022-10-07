import 'package:edu2gether_mobile/main.dart';
import 'package:edu2gether_mobile/screens/login/create_account.dart';
import 'package:edu2gether_mobile/screens/login/login.dart';
import 'package:edu2gether_mobile/screens/login/login_account.dart';
import 'package:get/get.dart';
class RoutesClass{
  static String home = "/";
  static String loginAccount = "/loginAccount";
  static String createAccount = "/createAccount";
  static String login = "/login";

  static String getHomeRoute() => home;
  static String getLoginAccountRoute() => loginAccount;
  static String getCreateAccountRoute() => createAccount;
  static String getLoginRoute() => login;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: loginAccount, page: () => const LoginAccount()),
    GetPage(name: createAccount, page: () => const CreateAccount()),
    GetPage(name: login, page: () => const Login()),
  ];
}