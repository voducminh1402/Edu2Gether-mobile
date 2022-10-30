import 'package:edu2gether_mobile/screens/user_profile/profile.dart';
import 'package:edu2gether_mobile/widgets/button_enroll_course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class PaymentEnrollCourse extends StatefulWidget{

  const PaymentEnrollCourse({super.key});

  @override
  State<PaymentEnrollCourse> createState() => _profilePaymentState();

}

class _profilePaymentState extends State<PaymentEnrollCourse>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Get.toNamed(RoutesClass.getProfileRoute());
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: const TextStyle(
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
                icon: const Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget> [
                  Padding(
                    padding: EdgeInsets.only(top: 24,bottom: 24,left: 24,right: 24),
                    child: Text(
                      'Select the payment method you want to use',
                      style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget> [
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: SizedBox(
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
            Padding(
              padding: const EdgeInsets.only(top:24),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget> [
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: SizedBox(
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
              padding: const EdgeInsets.only(top:24),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget> [
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: SizedBox(
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
                  alignment: FractionalOffset.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      height: 58,
                      width: 380,
                      child:  Card(
                        child: MaterialButton(
                            color: Colors.blueAccent,
                            onPressed: () => {},
                            child: const Text(
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
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ButtonEnrollCourse(route: RoutesClass.getProfilePaymentRoute(), title: 'Confirmation - 40'),
                ),
              ],
            )
          ],

        ),
      ),
    );
  }
}