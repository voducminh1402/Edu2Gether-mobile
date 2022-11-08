import 'dart:developer';

import 'package:edu2gether_mobile/models/course.dart';
import 'package:edu2gether_mobile/utilities/path.dart';
import 'package:http/http.dart' as http;

class MajorService{
  Future<List<Major>?> getMajors() async {
    try {
      var url = Uri.parse(Path.path + "/majors");
      var response = await http.get(url,
          headers: {
            "accept": "text/plain"
          });
      if (response.statusCode == 200) {
        List<Major> _model = majorFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }
}