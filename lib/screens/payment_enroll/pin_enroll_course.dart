

import 'package:edu2gether_mobile/routes/routes.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/button_confirm.dart';
import 'package:edu2gether_mobile/widgets/button_login.dart';
import 'package:flutter/material.dart';

class PinEnrollCourse extends StatefulWidget{
  @override
  _PinEnrollCourseState createState() => _PinEnrollCourseState();
}

class _PinEnrollCourseState extends State<PinEnrollCourse>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white
            ],
            begin: Alignment.topRight,
          )
        ),
        child: PinScreen(),
      ),
    );

  }

}

class PinScreen extends StatefulWidget{
  @override
  _PinScreen createState() => _PinScreen();
}

class _PinScreen extends State<PinScreen>{

  List<String> currentPin = ["","","",""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outLineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  int pinIndex  = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
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
            'Enroll Course',
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.white,
                )
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                  alignment: const Alignment(0,0.5),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      buildSecurityText(),
                      const SizedBox(height: 40.0,),
                      buildPinRow(),
                    ],
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: ContinueButton(),
            ),
            buildNumberPad(),
          ],
        ),
      ),
    );
  }

  ContinueButton(){
    return Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Urbanist'
              ),
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    width: 340,
                    height: 530,
                    child: AlertDialog(
                      scrollable: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0))),
                      title: SizedBox(
                          width: 150,
                          height: 130,
                          child: Image.asset('assets/image/successful.png')
                      ),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              const Text(
                                 'Enroll Course Successful!',
                                  style: TextStyle(fontFamily: 'Urbanist', fontSize: 20, fontWeight: FontWeight.w700,color: Colors.blueAccent),
                                ),
                              SizedBox(
                                height: 44,
                                width: 200,
                                child: Row(
                                  children: const [
                                    Flexible(
                                        child: Center(
                                          child: Text(
                                            'You have successfully made payment and enrolled the course.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontFamily: 'Urbanist', fontSize: 12, fontWeight: FontWeight.w400,color: Colors.black),
                                          ),
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: (){
                                    //Link to Course
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                                    shape: const StadiumBorder(),
                                ),
                                  child: const Expanded(
                                    child: FittedBox(
                                      child: Text("View Course",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  ////Link to Receipt
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                                  shape: const StadiumBorder(),
                                ),
                                child: const Expanded(
                                  child: FittedBox(
                                    child: Text("View E-Receipt",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Urbanist',
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
          child: const Text("Continue"),
        ),
    );
  }

  buildNumberPad(){
    return Expanded(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyboardNumber(
                      n:1,
                      onPressed: () {
                        pinIndexSetUp("1");
                      },
                    ),
                    KeyboardNumber(
                      n:2,
                      onPressed: () {
                        pinIndexSetUp("2");
                      },
                    ),
                    KeyboardNumber(
                      n:3,
                      onPressed: () {
                        pinIndexSetUp("3");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyboardNumber(
                      n:4,
                      onPressed: () {
                        pinIndexSetUp("4");
                      },
                    ),
                    KeyboardNumber(
                      n:5,
                      onPressed: () {
                        pinIndexSetUp("5");
                      },
                    ),
                    KeyboardNumber(
                      n:6,
                      onPressed: () {
                        pinIndexSetUp("6");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyboardNumber(
                      n:7,
                      onPressed: () {
                        pinIndexSetUp("7");
                      },
                    ),
                    KeyboardNumber(
                      n:8,
                      onPressed: () {
                        pinIndexSetUp("8");
                      },
                    ),
                    KeyboardNumber(
                      n:9,
                      onPressed: () {
                        pinIndexSetUp("9");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(
                      width: 60.0,
                      child: MaterialButton(
                        onPressed: null,
                        child: SizedBox(),
                      ),
                    ),
                    KeyboardNumber(
                      n:0,
                      onPressed: () {
                        pinIndexSetUp("0");
                      },
                    ),
                    SizedBox(
                      width: 60,
                      child: MaterialButton(
                        height: 60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        onPressed: (){
                          clearPin();
                        },
                        child: const Icon(Icons.backspace,color: Colors.black,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }

  pinIndexSetUp(String text){
    if(pinIndex == 0){
      pinIndex = 1;
    }
    else if(pinIndex < 4){
      pinIndex++;
    }
    setPin(pinIndex,text);
    currentPin[pinIndex-1] = text;
    String strPin = "";
    currentPin.forEach((element) {
      strPin += element;
    });
    if(pinIndex == 4){
      print(strPin);
    }
  }

  clearPin(){
    if(pinIndex == 0){
      pinIndex = 0;
    }
    else if(pinIndex == 4){
      setPin(pinIndex, "");
      currentPin[pinIndex-1] = "";
      pinIndex--;
    }
    else{
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  setPin(int n, String text){
    switch(n){
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  buttonContinue(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            ButtonConfirm(route: RoutesClass.getPaymentEnrollCourseRoute(), title: 'Confirmation - 40'),
          ],
        ),
      ),
    );
  }

  buildSecurityText() {
    return const Text(
        'Enter your PIN to confirm payment',
      style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w400, fontSize: 18,color: Colors.black),
    );
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PINNumber(
          outlineInputBorder: outLineInputBorder,
          textEditingController: pinOneController,
        ),
        PINNumber(
          outlineInputBorder: outLineInputBorder,
          textEditingController: pinTwoController,
        ),
        PINNumber(
          outlineInputBorder: outLineInputBorder,
          textEditingController: pinThreeController,
        ),
        PINNumber(
          outlineInputBorder: outLineInputBorder,
          textEditingController: pinFourController,
        ),
      ],
    );
  }

}

class PINNumber extends StatelessWidget {

  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;

  const PINNumber({required this.textEditingController,required this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16.0),
            border: outlineInputBorder,
            filled: true,
            fillColor: Colors.white,
        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21,
          color: Colors.black,
        ),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;

  const KeyboardNumber({required this.n,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: const EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90,
        child: Text("$n",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 24*MediaQuery.of(context).textScaleFactor,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

