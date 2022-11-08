import 'dart:convert';
import 'dart:developer';

import 'package:edu2gether_mobile/models/mark.dart';
import 'package:edu2gether_mobile/screens/my_book_mark/my_book_mark.dart';
import 'package:edu2gether_mobile/utilities/path.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MarkService{
  Future<Mark?> markCourse(Mark mark) async {
    try{
      var url = Uri.parse(Path.path + "/marks/mark");
      var response = await http.post(url,
          headers: {
            "accept": "text/plain",
            "Content-Type": "application/json"
          },
          body: jsonEncode(mark)
      );

      if(response.statusCode == 200){
        Mark _mark = Mark.fromJson(jsonDecode(response.body));
        Get.to(() => MyBookmarkPage());
        return _mark;
      }
    }
    catch(e)
    {
      print(e.toString());
      log(e.toString());
    }
  }
  Future<Mark?> unMarkCourse(Mark mark) async {
    try{
      var url = Uri.parse(Path.path + "/marks/un-mark");
      var response = await http.post(url,
          headers: {
            "accept": "text/plain",
            "Content-Type": "application/json"
          },
          body: jsonEncode(mark)
      );

      if(response.statusCode == 200){
        Mark _mark = Mark.fromJson(jsonDecode(response.body));
        Get.back();
        return _mark;
      }
    }
    catch(e)
    {
      print(e.toString());
      log(e.toString());
    }
  }
}