import 'dart:convert';
import 'dart:developer';
import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:http/http.dart' as http;

class MenteeService {
  Future<List<Mentee>?> getMentee() async {
    try {
      var url = Uri.parse("http://54.255.199.121/api/v1/mentees");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Mentee> _menteeModel = menteeFromJson(response.body);
        return _menteeModel;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

  Future<Mentee?> getMenteeById(id) async{
    try{
      var url = Uri.parse("http://54.255.199.121/api/v1/mentees/"+id.toString());
      var response = await http.get(url);
      if(response.statusCode == 200){
        Mentee _mentee = Mentee.fromJson(jsonDecode(response.body));
        return _mentee;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

  Future<Mentee?> updateMentee(Mentee mentee) async{
    try{
      var url = Uri.parse("http://54.255.199.121/api/v1/mentees");
      var response = await http.patch(url);
      if(response.statusCode == 200){
        Mentee _menteeUpdate = Mentee.fromJson(jsonDecode(response.body));
        return _menteeUpdate;
      }
    }
    catch(e)
    {
      print(e.toString());
      log(e.toString());
    }
  }

}