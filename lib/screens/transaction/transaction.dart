import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/models/payment.dart';
import 'package:edu2gether_mobile/models/transaction.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/transaction/ereceipt.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';
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
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    await AuthService().getUserLogin().then((value) async {
      _payments = (await PaymentService().getPaymentsByUserId(value.id))!;
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
      if(_payments != null){
        isLoaded = true;
      }
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
              Get.to(() => const MainPage());
            },
          ),
          title: Text(
            'Transaction',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimension.font8),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                )),
          ],
          elevation: 0
      ),
      body: Column(
        children: [
          //show body
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                //list transaction
                Container(
                  height: 700,
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      itemCount: _payments?.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => EReceiptPage(paymentId: _payments![i].id,));
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
                                            _payments![i].status!,
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
                                                  onPressed: () {
                                                    Get.to(EReceiptPage(paymentId: _payments![i].id,));
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
                )
              ],
            ),
            )
          ),
        ],
      ),
    );
  }
}
