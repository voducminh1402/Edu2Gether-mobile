// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'dart:convert';

List<Subject> subjectFromJson(String str) => List<Subject>.from(json.decode(str).map((x) => Subject.fromJson(x)));

String subjectToJson(List<Subject> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subject {
  Subject({
    required this.id,
    required this.name,
    required this.detail,
    required this.image,
    required this.majorId,
    required this.major,
  });

  int id;
  String name;
  String detail;
  String image;
  String majorId;
  var major;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"],
    name: json["name"],
    detail: json["detail"],
    image: json["image"],
    majorId: json["majorId"],
    major: json["major"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "detail": detail,
    "image": image,
    "majorId": majorId,
    "major": major,
  };
}
