import 'package:edu2gether_mobile/models/user.dart';
import 'package:edu2gether_mobile/services/payment_service.dart';
import 'package:edu2gether_mobile/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/payment.dart';
import '../../models/transaction.dart';
import '../../services/transaction_service.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class EReceiptPage extends StatefulWidget {
  int id;
  int transactionId;
  int menteeId;
  String walletId;
  EReceiptPage({required this.id, required this.transactionId, required this.menteeId, required this.walletId,Key? key}) : super(key: key);
  // const EReceiptPage({Key? key}) : super(key: key);
  // final int? paymentID;
  // const EReceiptPage({required this.paymentID});

  @override
  State<EReceiptPage> createState() => _EReceiptState();
}

class _EReceiptState extends State<EReceiptPage> {

  Payment? _payment = new Payment(id: 0, bookingId: 0, totalPrice: 0, status: "status", paymentType: "paymentType", failReason: "failReason");
  Transaction? _transaction = new Transaction(id: 0, createdTime: "createdTime", updatedTime: "updatedTime", paymentId: 0, description: "description", status: "status", amount: 0, walletId: 0);
  User? _user = new User(id: "id", email: "email", userName: "userName", password: "password", isActived: "isActived", roleID: 1, isSystemAdmin: true);
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getData();
    _getTransaction();
    _getUser();
  }

  void _getData() async {
    _payment = (await PaymentService.getPaymentById(widget.id))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_payment != null){
      isLoaded = true;
    }
  }

  void _getTransaction() async {
    _transaction = (await TransactionService.getTransactionByTransactionID(widget.transactionId))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_transaction != null){
      isLoaded = true;
    }
  }

  void _getUser() async {
    _user = (await UserService.getUserByWalletID(widget.walletId))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_user != null){
      isLoaded = true;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          Navigator.pop(context);
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
            Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Column(
                  children: [
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
                                    child: BigText(text: _transaction!.description, color: Colors.black, fontweight: FontWeight.w600, size: 16,),
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
                                    child: BigText(text: "Edu2Gether Coure Category", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
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
                        margin: EdgeInsets.only(top: 20),
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
                                    child: BigText(text: _user!.userName, color: Colors.black, fontweight: FontWeight.w600, size: 16,),
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
                                    child: BigText(text: _user!.email, color: Colors.black, fontweight: FontWeight.w600, size: 16,),
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
                        margin: EdgeInsets.only(top: 20),
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
                                    child: BigText(text: _payment!.paymentType, color: Colors.black, fontweight: FontWeight.w600, size: 16,),
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
                                    child: BigText(text: _transaction!.createdTime, color: Colors.black, fontweight: FontWeight.w600, size: 16,),
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
                                    child: BigText(text: _transaction!.id.toString(), color: Colors.black, fontweight: FontWeight.w600, size: 16,),
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
                ),
            ),
          ],
        ),
    );
  }
}
