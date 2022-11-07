import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/mark.dart';
import '../utilities/path.dart';

class MarkService{

  Future<Mark?> markACourse(Mark mark) async{
    try{
      var url = Uri.parse(Path.path + "/marks/mark");
      var response = await http.post(url,
          headers: {
            "accept": "text/plain",
            "Content-Type": "application/json"
          },
          body: jsonEncode(mark)
      );
    }catch(e)
    {
      print(e.toString());
      log(e.toString());
    }
  }


  Future<Mark?> unMarkACourse(Mark mark) async{
    try{
      var url = Uri.parse(Path.path + "/marks/un-mark");
      var response = await http.post(url,
          headers: {
            "accept": "text/plain",
            "Content-Type": "application/json"
          },
          body: jsonEncode(mark)
      );
    }catch(e)
    {
      print(e.toString());
      log(e.toString());
    }
  }

}