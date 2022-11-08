import 'dart:convert';
import 'dart:developer';
import 'package:edu2gether_mobile/models/payment.dart';
import 'package:edu2gether_mobile/models/transaction.dart';
import 'package:edu2gether_mobile/utilities/path.dart';
import 'package:http/http.dart' as http;


class PaymentService{
  Future<List<Payment>?> getPayment() async {
    try {
      var url = Uri.parse(Path.path  + "/payments");
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

  Future<List<Payment>?> getPaymentsByUserId(id) async {
    try {
      var url = Uri.parse(Path.path  + "/payments/users/" + id.toString());
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

  Future<Payment?> getPaymentById(id) async {
    try {
      var url = Uri.parse(Path.path  + "/payments/"+ id.toString());
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

  Future<Payment?> createPayment(Payment payment) async {
    try{
      var url = Uri.parse(Path.path + "/payments");
      var response = await http.post(url,
          headers: {
            "accept": "text/plain",
            "Content-Type": "application/json"
          },
          body: jsonEncode(payment)
      );

      if(response.statusCode == 201){
        Payment _payment = Payment.fromJson(jsonDecode(response.body));
        return _payment;
      }
    }
    catch(e)
    {
      print(e.toString());
      log(e.toString());
    }
  }
}