import 'package:edu2gether_mobile/services/paypal_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaypalPayment extends StatefulWidget {
  double price;
  String mentorId;
  String menteeId;
  int courseId;
  PaypalPayment({required this.price, required this.courseId, required this.menteeId, required this.mentorId, Key? key}) : super(key: key);

  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();
}

class _PaypalPaymentState extends State<PaypalPayment> {
  var checkoutUrl;
  var order;
  var orderId;
  var captureLink;

  PaypalService service = PaypalService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      try {
        Map<String, dynamic> transaction = {
          "intent": "AUTHORIZE",
          "purchase_units": [
            {
              "amount": {
                "currency_code": "USD",
                "value": widget.price
              }
            }
          ],
          "application_context": {
            "brand_name": "Edu2Gether",
            "shipping_preference": "NO_SHIPPING"
          }
        };
        order = await service.createCheckOutOrder(transaction);

        setState(() {
          checkoutUrl = order["approvalUrl"];
          orderId = order["orderId"];
        });

      } catch (e) {
        print(e.toString() + 'sai o trang paypal payment');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (checkoutUrl != null) {
      return Scaffold(
        body: SafeArea(
          child: WebView(
            initialUrl: checkoutUrl,
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {

              if (request.url.contains('paypal')) {
                captureLink = service.authorizePaymentOrder(orderId, widget.mentorId, widget.menteeId, widget.courseId, widget.price);
              }
              return NavigationDecision.navigate;
            },
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            semanticsLabel: 'Circular progress indicator',
          ),
        ),
      );
    }
  }
}
///Paypal Account
///sb-ftdd021746778@personal.example.com
///12345678
