import 'package:edu2gether_mobile/models/booking.dart';
import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/models/payment.dart';
import 'package:edu2gether_mobile/models/transaction.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/transaction/ereceipt.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
import 'package:edu2gether_mobile/services/booking_service.dart';
import 'package:edu2gether_mobile/services/course_service.dart';
import 'package:edu2gether_mobile/services/mentee_service.dart';
import 'package:edu2gether_mobile/services/payment_service.dart';
import 'package:edu2gether_mobile/services/transaction_service.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/defination_bottom_nav_text.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {


  late List<Payment>? _payments;
  List<Course>? _courses = [];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    await AuthService().getUserLogin().then((value) async {
      _payments = (await PaymentService().getPaymentsByUserId(value.id))!;

      for(var payment in _payments!){
        Booking? booking = await BookingService().getBookingById(payment.bookingId);
        Course? course = await CourseService().getCoursesById(booking!.courseId);
        _courses!.add(course!);
      }

      setState(() {
        if(_courses != null){
          isLoaded = true;
        }
      });
    });
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded ? const Scaffold(body: Center(child: CircularProgressIndicator(),)) :
    Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(

            icon: const Icon(

              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(() => MainPage());
            },
          ),
          title: Text(
            'Transaction',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimension.font8),
          ),
          elevation: 0
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: Dimension.height5, horizontal: Dimension.width10),
              itemCount: _payments?.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => EReceiptPage(paymentId: _payments![i].id,));
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(Dimension.radius12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(42), // Image radius
                              child: Image.network(_courses![i].image!,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: Dimension.width10,
                          ),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _courses![i].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimension.font8,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Urbanist'),
                                  ),
                                  SizedBox(
                                    height: Dimension.height5,
                                  ),
                                  Text(
                                    _payments![i].totalPrice.toString() + " USD",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimension.font6,
                                        fontFamily: 'Urbanist'),
                                  ),
                                  SizedBox(
                                    height: Dimension.height5,
                                  ),
                                  Text(
                                    _payments![i].status!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimension.font6,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Urbanist'),
                                  ),
                                ],
                              ))
                        ],
                      )),
                );
              }),

    );
  }
}
