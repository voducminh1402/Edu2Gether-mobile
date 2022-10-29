import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:edu2gether_mobile/models/course.dart';

class CourseService{
  Future<List<Course>?> getCourses() async {
    try {
      var url = Uri.parse("http://54.255.199.121/api/v1" + "/courses");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Course> _model = courseFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

  Future<List<Course>?> getCoursesByMentorId(id) async {
    try {
      id = 1;
      var url = Uri.parse("http://54.255.199.121/api/v1/courses/mentors/1");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Course> _coursesByMentorId = courseFromJson(response.body);
        return _coursesByMentorId;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }
}