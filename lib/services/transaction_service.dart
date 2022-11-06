import 'dart:convert';
import 'dart:developer';
import 'package:edu2gether_mobile/models/transaction.dart';
import 'package:http/http.dart' as http;

import '../utilities/path.dart';


class TransactionService{
  Future<List<Transaction>?> getTransaction() async {
    try {
      var url = Uri.parse(Path.path  + "/transactions");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Transaction> _model = transactionFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

  static Future<List<Transaction>?> getTransactionByID(id) async {
    try {
      var url = Uri.parse(Path.path  + "/transactions/users/" + id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Transaction> _model = transactionFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

  static Future<Transaction?> getTransactionByTransactionID(id) async {
    try {
      var url = Uri.parse(Path.path  + "/transactions/" + id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Transaction _model = Transaction.fromJson(jsonDecode(response.body));
        return _model;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }
}