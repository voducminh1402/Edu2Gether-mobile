import 'package:edu2gether_mobile/screens/login/create_account.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              child: Center(child: Image.asset('images/circle.png'),),
            ),
            SizedBox(
              height: 16,
            ),
            BigText(text: "Let's you in", size: 25,),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black,),
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
              height: 16,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black,),
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
              height: 16,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black,),
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
              height: 16,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 150, child: Divider(color: Colors.black)),
                  SizedBox(
                    width: 10,
                  ),
                  SmallText(text: 'or',),
                  SizedBox(
                    width: 10,
                  ),
                  Container(width: 150, child: Divider(color: Colors.black)),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 500,
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.mainColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(2, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                  child: SmallText(
                text: "Sign in with password",
                color: Colors.white,
              )),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
                child: RichText(
                text: new TextSpan( text: "Don't have an account?",
                style: TextStyle(fontFamily: 'Urbanist', color: Colors.black),
                children: <TextSpan>[
                  new TextSpan(
                    text: ' Sign up',
                    style: new TextStyle(
                      color: AppColors.mainColor,
                      fontFamily: 'Urbanist'
                    ),
                    recognizer: new TapGestureRecognizer()..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CreateAccount()),
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
