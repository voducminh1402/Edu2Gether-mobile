import 'dart:convert';
import 'dart:developer';
import 'package:edu2gether_mobile/models/user.dart';
import 'package:http/http.dart' as http;


class UserService{

  static Future<User?> getUserByWalletID(id) async {
    try {
      var url = Uri.parse("http://54.255.199.121/api/v1/wallets/"+ id.toString() +"/user");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        User _model = User.fromJson(jsonDecode(response.body));
        return _model;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }
}