import 'package:edu2gether_mobile/models/booking.dart';
import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/transaction/transaction.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
import 'package:edu2gether_mobile/services/booking_service.dart';
import 'package:edu2gether_mobile/services/course_service.dart';
import 'package:edu2gether_mobile/services/mentee_service.dart';
import 'package:edu2gether_mobile/services/payment_service.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../models/payment.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'package:intl/intl.dart';

class EReceiptPage extends StatefulWidget {
  int paymentId;
  EReceiptPage({required this.paymentId, Key? key}) : super(key: key);

  @override
  State<EReceiptPage> createState() => _EReceiptState();
}

class _EReceiptState extends State<EReceiptPage> {

  Payment? _payment;
  Booking? _booking;
  Course? _course;
  Mentee? _mentee;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _payment = await PaymentService().getPaymentById(widget.paymentId);
    _booking = await BookingService().getBookingById(_payment!.bookingId);
    _course = await CourseService().getCoursesById(_booking!.courseId);
    _mentee = await MenteeService().getMenteeById(_booking!.menteeId);

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_payment != null && _mentee != null && _booking != null && _course != null){
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded ? const Scaffold(body: Center(child: CircularProgressIndicator(),)) :
    Scaffold(
      body: Column(
          //show header
          children: [
            Container(
              margin: EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
              padding: EdgeInsets.only(top: 9.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context,
                              MaterialPageRoute(builder: (context) => const TransactionPage()));
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                        ),
                      ),
                      // BigText(text: "E-Receipt", color: Colors.black, size: 24, fontweight: FontWeight.w700,)
                      Text('E-Receipt', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),)

                    ],
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      child: Icon(Icons.more_horiz_outlined, color: Colors.black, size: 30,)
                  ),
                ],
              ),
            ),
            //show body
            Column(
              children: [
                Center(
                  child: Container(
                    height: Dimension.height50,
                    width: Dimension.width150,
                    child: SfBarcodeGenerator(
                      value: _payment!.failReason!.substring(5),
                      symbology: Code128C(),
                      showValue: true,
                    ),
                  ),
                ),
                SizedBox(height: Dimension.height3,),
                Container(
                  child: Container(
                    width: 380,
                    height: 112,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "Course", color: Colors.black, size: 14,),
                              Container(
                                child: BigText(text: _course!.name, color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "Category", color: Colors.black, size: 14,),
                              Container(
                                child: BigText(text: _course!.subject!.name, color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    margin: EdgeInsets.only(top: Dimension.height5),
                    width: 380,
                    height: 112,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "Username", color: Colors.black, size: 14,),
                              Container(
                                child: BigText(text: _mentee!.fullName!, color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                              )
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       SmallText(text: "Phone", color: Colors.black, size: 14,),
                        //       Container(
                        //         child: BigText(text: "+1 111 467 378 399", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "Email", color: Colors.black, size: 14,),
                              Container(
                                child: BigText(text: _mentee!.address, color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                              )
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       SmallText(text: "Country", color: Colors.black, size: 14,),
                        //       Container(
                        //         child: BigText(text: "United States", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    margin: EdgeInsets.only(top: Dimension.height5),
                    width: 380,
                    height: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "Price", color: Colors.black, size: 14,),
                              Container(
                                child: BigText(text: "\$" + _payment!.totalPrice.toString(), color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "Payment Methods", color: Colors.black, size: 14,),
                              Container(
                                child: BigText(text: _payment!.paymentType!, color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "Date", color: Colors.black, size: 14,),
                              Container(
                                child: BigText(text: DateFormat("yyyy-MM-dd HH:mm:ss").format(_booking!.bookingTime), color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "Transaction ID", color: Colors.black, size: 14,),
                              Container(
                                child: BigText(text: _payment!.failReason!.substring(5), color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "Status", color: Colors.black, size: 14,),
                              Container(
                                child: BigText(text: "Paid", color: Colors.blueAccent, fontweight: FontWeight.w600, size: 16,),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}
