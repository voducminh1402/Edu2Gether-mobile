import 'package:flutter/material.dart';

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
            Padding(
              padding: EdgeInsets.only(top:0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Container(
                    width: 380,
                    height: 28,
                    child: ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(top:0,left: 24,right: 0,bottom: 24),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}