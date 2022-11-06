import 'dart:convert';
import 'dart:developer';
import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/utilities/path.dart';
import 'package:http/http.dart' as http;

class MenteeService {
  Future<List<Mentee>?> getMentee() async {
    try {
      var url = Uri.parse(Path.path + "/mentees");
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
      var url = Uri.parse(Path.path+ "/mentees/"+id.toString());
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

  Future<Mentee?> editMentee(Mentee mentee, bool isCreate) async{
    try{
      var url = Uri.parse(Path.path + "/mentees");
      var response;
      if(isCreate){
        response = await http.post(url,
          headers: {
            "accept": "text/plain",
            "Content-Type": "application/json"
          },
          body: jsonEncode(mentee)
        );
      }
      else {
        response = await http.patch(url,
            headers: {
              "accept": "text/plain",
              "Content-Type": "application/json"
            },
            body: jsonEncode(mentee)
        );
      }

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
