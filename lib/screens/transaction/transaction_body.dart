import 'package:edu2gether_mobile/models/payment.dart';
import 'package:edu2gether_mobile/services/transaction_service.dart';
import 'package:edu2gether_mobile/services/payment_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import '../../models/transaction.dart';
import '../../utilities/colors.dart';
import '../../utilities/dimensions.dart';
import '../../widgets/defination_bottom_nav_text.dart';
import '../../widgets/small_text.dart';
import 'ereceipt.dart';

class TransactionBody extends StatefulWidget {
  const TransactionBody({Key? key}) : super(key: key);

  @override
  State<TransactionBody> createState() => _TransactionBodyState();
}

class _TransactionBodyState extends State<TransactionBody> {

  late List<Transaction>? _transaction = [];
  var isLoaded = false;

  //int id = 1;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _transaction = (await TransactionService.getTransactionByID(1))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_transaction != null){
      isLoaded = true;
    }
  }

  @override
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //list transaction
        Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Container(
            height: 700,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                itemCount: _transaction?.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () async {
                      Payment? payment = await PaymentService.getPaymentById(_transaction![i].paymentId);
                      print(payment!.id);
                      Get.to(EReceiptPage(id: payment.id, transactionId: _transaction![i].id, menteeId: _transaction![i].walletId, walletId: _transaction![i].walletId.toString(),));
                    },
                    child: Container(
                        padding: EdgeInsets.all(20),
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
                                size: Size.fromRadius(48), // Image radius
                                child: Image.asset('assets/images/transaction.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _transaction![i].description,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Urbanist'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Paid',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 18,
                                          fontFamily: 'Urbanist'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),Container(
                                        child: Row(
                                          children: [
                                            ElevatedButton.icon(
                                              onPressed: () async {
                                                Payment? payment = await PaymentService.getPaymentById(_transaction![i].paymentId);
                                                print(payment!.id);
                                                print(_transaction![i].walletId.toString());
                                                Get.to(EReceiptPage(id: payment.id, transactionId: _transaction![i].id, menteeId: _transaction![i].walletId, walletId: _transaction![i].walletId.toString(),));
                                              },
                                              icon: Icon(Icons.monetization_on_outlined),
                                              label: Text("E-Receipt"),
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(Dimension.radius16)),
                                                  ),
                                                  minimumSize: MaterialStateProperty.all(
                                                    Size(MediaQuery.of(context).size.width / 3.0, 30),
                                                  ),
                                                  textStyle: MaterialStateProperty.all(TextStyle(
                                                      fontSize: Dimension.font8,
                                                      fontWeight: FontWeight.bold)),
                                                  backgroundColor:
                                                  MaterialStateProperty.all(AppColors.mainColor)),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ))
                          ],
                        )),
                  );
                }),
          ),
        )
      ],
    );
  }
}
