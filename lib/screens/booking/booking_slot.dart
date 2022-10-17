import 'package:edu2gether_mobile/widgets/button_confirm.dart';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class BookingSlot extends StatefulWidget{

  const BookingSlot({super.key});

  @override
  State<BookingSlot> createState() => _bookingSlotState();

}

class _bookingSlotState extends State<BookingSlot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: (){

            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'Urbanist',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ) ,
          title: const Text(
            'Booking Slot',
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
                padding: EdgeInsets.only(top:24, left: 24, right: 24, bottom: 24),
              child: Container(
                child:  Text(
                  'Choose an available schedule, Appointment can only be made this month',
                  style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, bottom: 24),
                      child: Text(
                        'Choose Day . August 2021',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, fontFamily: 'Urbanist'),
                      ),
                    ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 83.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blueAccent,
                                      ),
                                      width: 62.0,
                                      child: Column(
                                        children: <Widget>[
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                              child:  Text(
                                                'Sun',
                                                style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left:25,top:10,right:25,bottom:16),
                                              child: Text(
                                                '8',
                                                style: TextStyle(fontFamily: 'Urbanist', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: 62.0,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
                                        child:  Text(
                                          'Mon',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:25,top:10,right:25,bottom:16),
                                        child: Text(
                                          '9',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: 62.0,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                        child:  Text(
                                          'Tue',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:25,top:10,right:25,bottom:16),
                                        child: Text(
                                          '10',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: 62.0,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
                                        child:  Text(
                                          'Wed',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:22,top:10,right:22,bottom:16),
                                        child: Text(
                                          '11',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: 62.0,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10, left: 18, right: 19),
                                        child:  Text(
                                          'Thu',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:25,top:10,right:25,bottom:16),
                                        child: Text(
                                          '12',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: 62.0,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                        child:  Text(
                                          'Fri',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:21,top:10,right:22,bottom:16),
                                        child: Text(
                                          '13',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: 62.0,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
                                        child:  Text(
                                          'Sat',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:25,top:10,right:25,bottom:16),
                                        child: Text(
                                          '14',
                                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    )
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 24,top: 30),
                    child: Text(
                      'Morning Slot',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, fontFamily: 'Urbanist'),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        onPressed: (){},
                        child: Text(
                          'Slot 1: 7:00 - 9:15',
                          style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: (){},
                      child: Text(
                        'Slot 2: 9:45 - 12:00',
                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 24,top: 30),
                    child: Text(
                      'Afternoon Slot',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, fontFamily: 'Urbanist'),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: (){},
                      child: Text(
                        'Slot 3: 12:30 - 14:45',
                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: (){},
                      child: Text(
                        'Slot4: 15:15 - 17:30 ',
                        style: TextStyle(fontFamily: 'Urbanist', fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 50),
                  child: ButtonConfirm(route: RoutesClass.getPinEnrollCourseRoute(), title: 'Confirmation - 40'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}