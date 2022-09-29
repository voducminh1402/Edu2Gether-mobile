import 'package:edu2gether_mobile/screens/login/create_account.dart';
import 'package:edu2gether_mobile/screens/login/login.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../widgets/big_text.dart';

class LoginAccount extends StatefulWidget {
  const LoginAccount({Key? key}) : super(key: key);

  @override
  State<LoginAccount> createState() => _LoginAccountState();
}

class _LoginAccountState extends State<LoginAccount> {
  bool _passwordVisible = false;
  bool _rememberAccount = false;

  @override
  void initState() {
    _passwordVisible = false;
    _rememberAccount = false;
  }

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
              Text(
                style: TextStyle(
                    fontSize: Dimension.font24,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold),
                "Login to your Account",
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_rounded),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(Dimension.radius12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.mainColor),
                      borderRadius: BorderRadius.circular(Dimension.radius12)),
                  hintText: 'Email',
                  fillColor: AppColors.inputColor,
                  filled: true,
                ),
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisible,
                style: TextStyle(
                  fontSize: Dimension.font10,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_clock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(Dimension.radius12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.mainColor),
                      borderRadius: BorderRadius.circular(Dimension.radius12)),
                  hintText: 'Password',
                  fillColor: AppColors.inputColor,
                  filled: true,
                ),
              ),
              SizedBox(
                height: Dimension.height5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    side: BorderSide(color: AppColors.mainColor, width: 2),
                    checkColor: Colors.greenAccent,
                    activeColor: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    value: _rememberAccount,
                    onChanged: (value) {
                      setState(() {
                        _rememberAccount = value!;
                      });
                    },
                  ),
                  Text('Remembered me', style: TextStyle(
                      fontSize: Dimension.font8,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Urbanist')),
                ],
              ),
              SizedBox(
                height: Dimension.height5,
              ),
              Container(
                padding: EdgeInsets.only(top: Dimension.height10, bottom: Dimension.height10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius16),
                  color: AppColors.mainColor,

                ),
                child: Center(
                    child: SmallText(
                      text: "Sign up",
                      color: Colors.white,
                      size: Dimension.font10,
                    )),
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              Text('Forgot the password?', style: TextStyle(
                  fontSize: Dimension.font8,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                  fontFamily: 'Urbanist')),
              SizedBox(
                height: Dimension.height10,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: AppColors.mainColor,)),
                    SizedBox(
                      width: Dimension.width10,
                    ),
                    SmallText(text: 'or continue with', size: Dimension.font8,),
                    SizedBox(
                      width: Dimension.width10,
                    ),
                    Expanded(child: Divider(color: AppColors.mainColor,)),
                  ],
                ),
              ),
              SizedBox(
                height: Dimension.height12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                    child: Icon(Icons.facebook_outlined, color: AppColors.mainColor,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.inputColor)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                    child: Icon(Icons.facebook_outlined, color: AppColors.mainColor,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.inputColor)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                    child: Icon(Icons.facebook_outlined, color: AppColors.mainColor,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.inputColor)
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimension.height18,
              ),
              Center(
                  child: RichText(
                    text: new TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(fontFamily: 'Urbanist', color: Colors.black),
                      children: <TextSpan>[
                        new TextSpan(
                          text: ' Sign in',
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
    );
  }
}
