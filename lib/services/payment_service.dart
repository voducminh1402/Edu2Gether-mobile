import 'dart:convert';
import 'dart:developer';
import 'package:edu2gether_mobile/models/payment.dart';
import 'package:edu2gether_mobile/models/transaction.dart';
import 'package:http/http.dart' as http;


class PaymentService{
  Future<List<Payment>?> getPayment() async {
    try {
      var url = Uri.parse("http://54.255.199.121/api/v1/transactions");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Payment> _model = paymentFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

  static Future<Payment?> getPaymentById(id) async {
    try {
      var url = Uri.parse("http://54.255.199.121/api/v1/payments/"+ id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Payment _model = Payment.fromJson(jsonDecode(response.body));
        return _model;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }
}