import 'package:edu2gether_mobile/screens/user_profile/paypal_payment.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../main_page/main_page.dart';

class ProfilePayment extends StatefulWidget{

  const ProfilePayment({super.key});

  @override
  State<ProfilePayment> createState() => _profilePaymentState();

}

class _profilePaymentState extends State<ProfilePayment>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => MainPage()));
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ) ,
          title: const Text(
            'Payment',
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const PaypalPayment()));
              },
              child: Padding(
                padding: EdgeInsets.only(top:0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                          width: 380,
                          height: 70,
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                                leading: Padding(
                                  padding: EdgeInsets.only(top:15,left: 24,right: 0,bottom: 24),
                                  child: SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: Icon(Icons.paypal_sharp,color: Colors.black,),
                                  ),
                                ),
                                title: Text(
                                  'Paypal',
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing: Text(
                                  'Connected',
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue,
                                  ),
                                )
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:24),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                        width: 380,
                        height: 70,
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(top:15,left: 24,right: 0,bottom: 24),
                                child: SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: Icon(Icons.apple_rounded,color: Colors.black,),
                                ),
                              ),
                              title: Text(

                                'Apple Pay',
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Text(
                                'Connected',
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue,
                                ),
                              )
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:24),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                        width: 380,
                        height: 70,
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(top:15,left: 24,right: 0,bottom: 24),
                                child: SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: Icon(Icons.credit_card_sharp,color: Colors.black,),
                                ),
                              ),
                              title: Text(

                                'Visa Card',
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Text(
                                'Connected',
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue,
                                ),
                              )
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      height: 58,
                      width: 380,
                      child:  Card(
                        child: MaterialButton(
                            color: Colors.blueAccent,
                            onPressed: () => {},
                            child: Text(
                              'Add new card',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ],

        ),
      ),
    );
  }
}