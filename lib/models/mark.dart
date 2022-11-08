// To parse this JSON data, do
//
//     final mark = markFromJson(jsonString);

import 'dart:convert';

List<Mark> markFromJson(String str) => List<Mark>.from(json.decode(str).map((x) => Mark.fromJson(x)));

String markToJson(List<Mark> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mark {
  Mark({
    required this.courseId,
    required this.menteeId,
  });

  int courseId;
  String menteeId;

  factory Mark.fromJson(Map<String, dynamic> json) => Mark(
    courseId: json["courseId"],
    menteeId: json["menteeId"],
  );

  Map<String, dynamic> toJson() => {
    "courseId": courseId,
    "menteeId": menteeId,
  };
}
