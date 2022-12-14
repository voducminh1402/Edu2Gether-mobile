import 'dart:convert';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get/get.dart';

class PaypalService{
  String domain = "https://api-m.sandbox.paypal.com";

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


  Future<String> authorizePaymentOrder(orderId) async{
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
          capturePayment(capture);
          return body['id'];
        }
        throw Exception("0");
      }
      return response.statusCode.toString();
    } catch(e){
      rethrow;
    }
  }

  Future<String> capturePayment(url) async{
    try{
      var response = await http.post(Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 201){
        final body = convert.jsonDecode(response.body);
        Get.to(() => MainPage());
        return body['id'];
      }
      return response.statusCode.toString();
    } catch(e){
      rethrow;
    }
  }

}