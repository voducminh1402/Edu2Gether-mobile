import 'dart:convert';
import 'package:edu2gether_mobile/models/booking.dart';
import 'package:edu2gether_mobile/models/payment.dart';
import 'package:edu2gether_mobile/models/transaction.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/transaction/ereceipt.dart';
import 'package:edu2gether_mobile/services/booking_service.dart';
import 'package:edu2gether_mobile/services/payment_service.dart';
import 'package:edu2gether_mobile/services/transaction_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get/get.dart';

class PaypalService{
  String domain = "https://api-m.sandbox.paypal.com";
  String? orderId;

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    "Authorization": 'Basic QVpyWmw1UEJJc1R3Qk56ZFdSaTM0UkpGYVFFWElsZmphN2p1ZzF1M3dmZUt1WDVJR2dZeDVwc3VNaUU5eXdCWnNMai0wTWt4T2dLeU5WYjk6RU1WTENfZ2NuQlgza0QwcFFiZkFQYV9MbGFqLW9uc0RwVU5rZk9wVDUtUHE4bVdoeC1RM1BadTZ0M2l1WVRpSGktRndmNlVWN0FCcVgtQXo=',
  };

  Future<Map<String, String>> createCheckOutOrder(transaction) async{
    try{
      var response = await http.post(Uri.parse('$domain/v2/checkout/orders'),
          headers: headers,
          body: jsonEncode(transaction)
      );
      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (body["links"] != null && body["links"].length > 0) {
          List links = body["links"];
          String approvalUrl = "";

          final item = links.firstWhere((element) =>
          element["rel"] == "approve", orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }
          print('order id ' + body['id']);
          orderId = body["id"];
          return {"approvalUrl": approvalUrl, 'orderId': body["id"]};
        }
        throw Exception("0");
      }
      else {
        throw Exception(
            body["message"] + response.statusCode.toString() + "sai o create order");
      }

    } catch(e){
      rethrow;
    }
  }


  Future<String> authorizePaymentOrder(orderId, mentorId, menteeId, courseId, price) async{
    try{
      var response = await http.post(Uri.parse('$domain/v2/checkout/orders/$orderId/authorize'),
        headers: headers,
      );
      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 201){
        if (body["purchase_units"] != null && body["purchase_units"].length > 0) {
          List links = body["purchase_units"][0]['payments']['authorizations'][0]['links'];
          String capture = "";

          final item = links.firstWhere((element) =>
          element["rel"] == "capture", orElse: () => null);
          if (item != null) {
            capture = item["href"];
          }
          capturePayment(capture, mentorId, menteeId, courseId, price);
          return body['id'];
        }
        throw Exception("0");
      }
      return response.statusCode.toString();
    } catch(e){
      rethrow;
    }
  }

  Future<String> capturePayment(url, mentorId, menteeId, courseId, price) async{
    try{
      var response = await http.post(Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 201){
        final body = convert.jsonDecode(response.body);
        Booking booking = Booking(id: 1, mentorId: mentorId, menteeId: menteeId, courseId: courseId, bookingTime: DateTime.now(), status: "Complete", coursePrice: price, slotId: 1);
        Booking? bookingResponse = await BookingService().createBooking(booking);
        Payment payment = Payment(paypalId: orderId!, bookingId: bookingResponse!.id, id: 1, totalPrice: price, status: "Completed", paymentType: "Paypal", failReason: "");
        Payment? paymentResponse = await PaymentService().createPayment(payment);

        Get.to(() => EReceiptPage(paymentId: paymentResponse!.id));
        return body['id'];
      }
      return response.statusCode.toString();
    } catch(e){
      rethrow;
    }
  }

}