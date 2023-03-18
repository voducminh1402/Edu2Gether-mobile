import 'dart:convert';

import 'dart:developer';
import 'package:edu2gether_mobile/utilities/path.dart';
import 'package:http/http.dart' as http;

import 'package:edu2gether_mobile/models/mentor.dart';

class MentorService{
  Future<List<Mentor>?> getMentor() async {
    try {
      var url = Uri.parse(Path.path  + "/mentors");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Mentor> _mentorModel = mentorFromJson(response.body);
        return _mentorModel;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

  Future<Mentor?> getMentorById(id) async{
    try{
      var url = Uri.parse(Path.path  + "/mentors/" + id.toString());
      var response = await http.get(url);
      if(response.statusCode == 200){
        Mentor _mentor = Mentor.fromJson(jsonDecode(response.body));
        return _mentor;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

  Future<List<Mentor>?> getMentorsBySubjectName(String name) async {
    try {
      var url = Uri.parse(Path.path  + "/mentors/subjects/$name");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Mentor> _mentorModel = mentorFromJson(response.body);
        return _mentorModel;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }
}