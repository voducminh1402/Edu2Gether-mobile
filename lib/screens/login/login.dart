import 'package:edu2gether_mobile/screens/login/create_account.dart';
import 'package:edu2gether_mobile/screens/login/login_account.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utilities/dimensions.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
              left: Dimension.width16,
              right: Dimension.width16,
              top: Dimension.height16,
              bottom: Dimension.height16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: Dimension.height10, bottom: Dimension.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back))
                  ],
                ),
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              Container(
                width: Dimension.width100,
                height: Dimension.height100,
                child: Center(
                  child: Image.asset('assets/images/circle.png'),
                ),
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              Text(
                style: TextStyle(
                    fontSize: Dimension.font24,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold),
                "Let's you in",
              ),
              SizedBox(
                height: Dimension.height10,
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
                    Icon(
                      Icons.facebook_outlined,
                      color: Colors.blue,
                    ),
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
                    Icon(
                      Icons.facebook_outlined,
                      color: Colors.blue,
                    ),
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
                    Icon(
                      Icons.facebook_outlined,
                      color: Colors.blue,
                    ),
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
              SizedBox(
                height: Dimension.height5,
              ),
              SizedBox(
                height: Dimension.height5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginAccount()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height10, bottom: Dimension.height10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius16),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                      child: SmallText(
                    text: "Sign in with password",
                    color: Colors.white,
                    size: Dimension.font10,
                  )),
                ),
              ),
              SizedBox(
                height: Dimension.height20,
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
                      size: Dimension.font8,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateAccount()),
                          );
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
