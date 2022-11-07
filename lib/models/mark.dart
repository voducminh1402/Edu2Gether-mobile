// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

List<Mark> markFromJson(String str) => List<Mark>.from(json.decode(str).map((x) => Mark.fromJson(x)));

String markToJson(List<Mark> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mark {
  Mark({
    required this.courseId,
    required this.menteeID,
  });

  int courseId;
  String menteeID;


  factory Mark.fromJson(Map<String, dynamic> json) => Mark(
    courseId: json["courseId"],
    menteeID: json["menteeID"],
  );

  Map<String, dynamic> toJson() => {
    "courseId": courseId,
    "menteeID": menteeID,
  };
}
