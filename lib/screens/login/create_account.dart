
import 'package:edu2gether_mobile/routes/routes.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
import 'package:edu2gether_mobile/screens/login/login.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/colors.dart';
import '../../widgets/button_login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _passwordVisible = false;
  bool _rememberAccount = false;
  late String _email;
  late String _password;

  @override
  void initState() {
    _passwordVisible = false;
    _rememberAccount = false;
  }

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
              Get.toNamed(RoutesClass.getLoginRoute());
              // Navigator.pop(context);
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
              Text(
                style: TextStyle(
                    fontSize: Dimension.font16,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold),
                "Create your Account",
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
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisible,
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
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
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
                  Text('Remembered me',
                      style: TextStyle(
                          fontSize: Dimension.font6,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Urbanist')),
                ],
              ),
              SizedBox(
                height: Dimension.height5,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(MediaQuery.of(context).size.width, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  AuthService().createUserWithEmailAndPassword(_email, _password);
                },
                child: Text(
                    'Sign up'
                ),
              ),
              SizedBox(
                height: Dimension.height24,
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
                      text: 'or continue with',
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
                height: Dimension.height10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Icon(
                      Icons.facebook_outlined,
                      color: AppColors.mainColor,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.inputColor)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Icon(
                      Icons.facebook_outlined,
                      color: AppColors.mainColor,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.inputColor)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Icon(
                      Icons.facebook_outlined,
                      color: AppColors.mainColor,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.inputColor)),
                  ),
                ],
              ),
              SizedBox(
                height: Dimension.height12,
              ),
              Center(
                  child: RichText(
                    text: new TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(fontFamily: 'Urbanist', color: Colors.black),
                      children: <TextSpan>[
                        new TextSpan(
                          text: ' Sign in',
                          style: new TextStyle(
                              color: AppColors.mainColor, fontFamily: 'Urbanist'),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RoutesClass.getLoginRoute());

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const Login()),
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
    );
  }
}