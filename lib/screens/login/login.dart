import 'package:edu2gether_mobile/routes/routes.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../utilities/dimensions.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
              left: Dimension.width10,
              right: Dimension.width10,
              top: Dimension.height10,
              bottom: Dimension.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Dimension.height20,
              ),
              SizedBox(
                width: Dimension.width50,
                height: Dimension.height50,
                child: Center(
                  child: Image.asset('assets/logos/Logo-edu2-fix-02.png',
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              Text(
                style: TextStyle(
                    fontSize: Dimension.font16,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold),
                "Let's you in",
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(MediaQuery.of(context).size.width, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  await AuthService().signInWithGoogle();
                  await AuthService().checkUserState();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                label: const Text(
                  "Continue with Google",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: Dimension.height5,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(MediaQuery.of(context).size.width, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  await AuthService().signInWithGoogle();
                  await AuthService().checkUserState();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
                label: const Text(
                  "Continue with Facebook",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: Dimension.height5,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(MediaQuery.of(context).size.width, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  await AuthService().signInWithGoogle();
                  await AuthService().checkUserState();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.apple,
                  color: Colors.grey,
                ),
                label: const Text(
                  "Continue with Apple",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: Dimension.height16,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Divider(
                      color: AppColors.mainColor,
                    )),
                    SizedBox(
                      width: Dimension.width10,
                    ),
                    SmallText(
                      text: 'or',
                      size: 14,
                    ),
                    SizedBox(
                      width: Dimension.width10,
                    ),
                    Expanded(
                        child: Divider(
                      color: AppColors.mainColor,
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: Dimension.height12,
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: const TextStyle(
                      fontFamily: 'Urbanist', color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Sign up',
                      style: TextStyle(
                          color: AppColors.mainColor, fontFamily: 'Urbanist'),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RoutesClass.getCreateAccountRoute());
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const CreateAccount()),
                          // );
                        },
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    ); //MaterialApp(
  }
}
