import 'dart:convert';
import 'dart:developer';
import 'package:edu2gether_mobile/models/user.dart';
import 'package:edu2gether_mobile/utilities/path.dart';
import 'package:http/http.dart' as http;


class UserService{

  static Future<User?> getUserByWalletID(id) async {
    try {
      var url = Uri.parse(Path.path  + "/wallets/"+ id.toString() +"/user");
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