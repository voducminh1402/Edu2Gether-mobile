import 'package:edu2gether_mobile/routes/routes.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
import 'package:edu2gether_mobile/screens/login/create_account.dart';
import 'package:edu2gether_mobile/screens/login/login_account.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/widgets/button_login.dart';
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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              //Navigator.pop(context);
            },
          ),
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
              Container(
                width: Dimension.width50,
                height: Dimension.height50,
                child: Center(

                  child:Image.asset('assets/logos/Logo-edu2-fix-02.png',
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
                height: Dimension.height10,
              ),
              GestureDetector(
                onTap: () {
                  AuthService().signInWithGoogle();
                  AuthService().checkUserState();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.google, color: Colors.red,),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "Continue with Google"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Dimension.height5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.facebook, color: Colors.blue,),

                    SizedBox(
                      width: 10,
                    ),
                    SmallText(text: "Continue with Facebook"),
                  ],
                ),
              ),
              SizedBox(
                height: Dimension.height5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.apple, color: Colors.black,),

                    SizedBox(
                      width: 10,
                    ),
                    SmallText(text: "Continue with Apple"),
                  ],
                ),
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              ButtonLogin(route: RoutesClass.getLoginAccountRoute(), title: 'Sign in with password',),
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
                text: new TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(fontFamily: 'Urbanist', color: Colors.black),
                  children: <TextSpan>[
                    new TextSpan(
                      text: ' Sign up',
                      style: new TextStyle(
                          color: AppColors.mainColor, fontFamily: 'Urbanist'),
                      recognizer: new TapGestureRecognizer()
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