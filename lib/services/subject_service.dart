import 'dart:developer';
import 'package:edu2gether_mobile/models/course.dart';
import 'package:http/http.dart' as http;

import 'package:edu2gether_mobile/models/subject.dart';


class SubjectService{
  Future<List<Subject>?> getSubject() async {
    try {
      var url = Uri.parse("http://54.255.199.121/api/v1/subjects");
      var response = await http.get(url,
      headers: {
        "accept": "text/plain"
      });
      if (response.statusCode == 200) {
        List<Subject> _model = subjectFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

  Future<List<Subject>?> getSubjectById(int id) async {
    try {
      var url = Uri.parse("http://54.255.199.121/api/v1/subjects/" + id.toString());
      var response = await http.get(url,
          headers: {
            "accept": "text/plain"
          });
      if (response.statusCode == 200) {
        List<Subject> _modelById = subjectFromJson(response.body);
        return _modelById;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

}