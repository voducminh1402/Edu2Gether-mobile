import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:edu2gether_mobile/models/mentor.dart';

class MentorService{
  Future<List<Mentor>?> getMentor() async {
    try {
      var url = Uri.parse("http://54.255.199.121/api/v1/mentors");
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