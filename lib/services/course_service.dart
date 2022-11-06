import 'dart:developer';
import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/utilities/path.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:edu2gether_mobile/models/course.dart';

class CourseService{
  Future<List<Course>?> getCourses() async {
    try {
      var url = Uri.parse(Path.path + "/courses");
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
      var url = Uri.parse(Path.path+ "/courses/mentors/" + id.toString());
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

  Future<List<Course>?> getBookmarkByUserId(id) async {
    try {
      var url = Uri.parse(Path.path+ "/marks/users/" + id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Course> _courses = courseFromJson(response.body);
        return _courses;

      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }

}