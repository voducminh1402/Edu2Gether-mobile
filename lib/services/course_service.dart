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

  Future<List<Course>?> getCoursesByMajorName(majorName) async {
    try {
      var url = Uri.parse(Path.path + "/courses/major?majorName=" + majorName.toString());
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

  Future<List<Course>?> getCoursesByName(name) async {
    try {
      var url = Uri.parse(Path.path + "/courses/course?name=" + name.toString());
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

  Future<Course?> getCoursesById(id) async {
    try {
      var url = Uri.parse(Path.path+ "/courses/" + id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Course _course = Course.fromJson(jsonDecode(response.body));
        return _course;

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
      var url = Uri.parse(Path.path + "/marks/users/${id}");
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

  Future<List<Course>?> getBookmarkByUserIdWithSearchString(userId, search) async {
    try {
      var url = Uri.parse(Path.path + "/marks/search/user?userId=" + userId.toString() + "&search=" + search.toString());
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

  Future<List<Course>?> getBookmarkByUserIdWithMajorId(userId, majorId) async {
    try {
      var url = Uri.parse(Path.path + "/marks/search/user-major?majorId=" + majorId.toString() + "&userId=" + userId.toString());
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

  Future<List<Course>?> getOnGoingCoursesForUser() async {
    try {
      var url = Uri.parse(Path.path + "/courses/course/on-going");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Course> _courses = courseFromJson(response.body);
        return _courses;
      }
     
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
    print('Trung trung');
    return null;
  }

  Future<List<Course>?> getCompletedCoursesForUser(id) async {
    try {
      var url = Uri.parse(Path.path + "/courses/course/completed/" + id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Course> _courses = courseFromJson(response.body);
        return _courses;
      }
      return null;
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
    return null;
  }

  Future<bool?> canEnroll(userId, courseId) async {
    try{
      var url = Uri.parse(Path.path + "/courses/validate?courseId=" + courseId.toString() + "&userId=" + userId.toString());
      var response = await http.get(url,
          headers: {
            "accept": "text/plain",
          }
      );
      final body = jsonDecode(response.body);
      if(response.statusCode == 200){
        return body;
      }
      return true;
    }
    catch(e)
    {
      print(e.toString());
      log(e.toString());
    }
  }
}