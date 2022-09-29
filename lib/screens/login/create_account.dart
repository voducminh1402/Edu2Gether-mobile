import 'package:edu2gether_mobile/screens/login/login.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../widgets/big_text.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigText(
              text: "Create your Account",
              size: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_rounded),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.mainColor
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Email',
                  fillColor: AppColors.inputColor,
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisible,
                style: TextStyle(
                  fontSize: 20,
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
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.mainColor
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Password',
                  fillColor: AppColors.inputColor,
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                SmallText(text: 'Remembered me', size: 16,),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 500,
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.mainColor,

              ),
              child: Center(
                  child: SmallText(
                    text: "Sign up",
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 100, child: Divider(color: AppColors.inputColor)),
                  SizedBox(
                    width: 10,
                  ),
                  SmallText(text: 'or continue with',),
                  SizedBox(
                    width: 10,
                  ),
                  Container(width: 100, child: Divider(color: AppColors.inputColor)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
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
              height: 10,
            ),
            Center(
                child: RichText(
                  text: new TextSpan( text: "Already have an account?",
                    style: TextStyle(fontFamily: 'Urbanist', color: Colors.black),
                    children: <TextSpan>[
                      new TextSpan(
                        text: ' Sign in',
                        style: new TextStyle(
                            color: AppColors.mainColor,
                            fontFamily: 'Urbanist'
                        ),
                        recognizer: new TapGestureRecognizer()..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login()),
                          );
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}