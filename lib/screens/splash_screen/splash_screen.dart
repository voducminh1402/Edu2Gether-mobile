import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:edu2gether_mobile/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset("assets/logos/Logo-edu2-fix-01.png"),
            nextScreen: const Login(),
            splashIconSize: 200,
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.leftToRightWithFade,
            animationDuration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.white));
  }
}
