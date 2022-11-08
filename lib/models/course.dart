// // To parse this JSON data, do
// //
// //     final course = courseFromJson(jsonString);
//
// import 'dart:convert';
//
// List<Course> courseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));
//
// String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Course {
//   Course({
//     required this.id,
//     required this.name,
//     this.detail,
//     this.videoUrl,
//     this.image,
//     required this.price,
//     required this.discount,
//     required this.capacity,
//     required this.classUrl,
//     required this.estimateHour,
//     required this.subjectId,
//     required this.mentorId,
//     required this.createTime,
//     this.updateTime,
//     this.publishDate,
//     required this.isActived,
//     required this.approver,
//     required this.approveStatus,
//   });
//
//   int id;
//   String name;
//   String? detail;
//   String? videoUrl;
//   String? image;
//   double price;
//   double discount;
//   int capacity;
//   String classUrl;
//   double estimateHour;
//   int subjectId;
//   String mentorId;
//   DateTime createTime;
//   DateTime? updateTime;
//   DateTime? publishDate;
//   String isActived;
//   String approver;
//   int approveStatus;
//
//   factory Course.fromJson(Map<String, dynamic> json) => Course(
//     id: json["id"],
//     name: json["name"],
//     detail: json["detail"],
//     videoUrl: json["videoUrl"],
//     image: json["image"],
//     price: json["price"],
//     discount: json["discount"],
//     capacity: json["capacity"],
//     classUrl: json["classUrl"],
//     estimateHour: json["estimateHour"],
//     subjectId: json["subjectId"],
//     mentorId: json["mentorId"],
//     createTime: DateTime.parse(json["createTime"]),
//     updateTime: json["updateTime"],
//     publishDate: json["publishDate"],
//     isActived: json["isActived"],
//     approver: json["approver"],
//     approveStatus: json["approveStatus"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "detail": detail,
//     "videoUrl": videoUrl,
//     "image": image,
//     "price": price,
//     "discount": discount,
//     "capacity": capacity,
//     "classUrl": classUrl,
//     "estimateHour": estimateHour,
//     "subjectId": subjectId,
//     "mentorId": mentorId,
//     "createTime": createTime.toIso8601String(),
//     "updateTime": updateTime,
//     "publishDate": publishDate,
//     "isActived": isActived,
//     "approver": approver,
//     "approveStatus": approveStatus,
//   };
// }
// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

import 'package:edu2gether_mobile/models/mentor.dart';

List<Course> courseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Subject> subjectFromJson(String str) => List<Subject>.from(json.decode(str).map((x) => Subject.fromJson(x)));

String subjectToJson(List<Subject> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Major> majorFromJson(String str) => List<Major>.from(json.decode(str).map((x) => Major.fromJson(x)));

String majorToJson(List<Major> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  Course({
    required this.id,
    required this.name,
     this.detail,
     this.videoUrl,
     this.image,
    required this.price,
    required this.discount,
    required this.capacity,
    required this.classUrl,
    required this.estimateHour,
    required this.subjectId,
    required this.mentorId,
    required this.createTime,
     this.updateTime,
     this.publishDate,
    required this.isActived,
    required this.approver,
    required this.approveStatus,
    this.subject,
    this.major,
    this.mentor
  });

  int id;
  String name;
  String? detail;
  String? videoUrl;
  String? image;
  double price;
  double discount;
  int capacity;
  String classUrl;
  double estimateHour;
  int subjectId;
  String mentorId;
  DateTime createTime;
  DateTime? updateTime;
  DateTime? publishDate;
  String isActived;
  String approver;
  int approveStatus;
  Subject? subject;
  Major? major;
  Mentor? mentor;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    name: json["name"],
    detail: json["detail"],
    videoUrl: json["videoUrl"],
    image: json["image"],
    price: json["price"],
    discount: json["discount"],
    capacity: json["capacity"],
    classUrl: json["classUrl"],
    estimateHour: json["estimateHour"],
    subjectId: json["subjectId"],
    mentorId: json["mentorId"],
    createTime: DateTime.parse(json["createTime"]),
    updateTime: json["updateTime"],
    publishDate: json["publishDate"],
    isActived: json["isActived"],
    approver: json["approver"],
    approveStatus: json["approveStatus"],
    subject:json["subject"] == null ? null : Subject.fromJson(json["subject"]),
    major: json["major"] == null ? null : Major.fromJson(json["major"]),
    mentor: json["mentor"] == null ? null : Mentor.fromJson(json["mentor"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "detail": detail,
    "videoUrl": videoUrl,
    "image": image,
    "price": price,
    "discount": discount,
    "capacity": capacity,
    "classUrl": classUrl,
    "estimateHour": estimateHour,
    "subjectId": subjectId,
    "mentorId": mentorId,
    "createTime": createTime.toIso8601String(),
    "updateTime": updateTime,
    "publishDate": publishDate,
    "isActived": isActived,
    "approver": approver,
    "approveStatus": approveStatus,
    "subject": subject == null ? null : subject!.toJson(),
    "major": major == null ? null : major!.toJson(),
    "mentor": mentor == null ? null : mentor!.toJson(),
  };
}

class Major {
  Major({
    required this.id,
    required this.name,
    required this.detail,
    required this.image,
  });

  int id;
  String name;
  String detail;
  String image;

  factory Major.fromJson(Map<String, dynamic> json) => Major(
    id: json["id"],
    name: json["name"],
    detail: json["detail"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "detail": detail,
    "image": image,
  };
}

class Subject {
  Subject({
    required this.id,
    required this.name,
    required this.detail,
    required this.image,
    required this.majorId,
     this.major,
  });

  int id;
  String name;
  String detail;
  String image;
  int majorId;
  Major? major;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"],
    name: json["name"],
    detail: json["detail"],
    image: json["image"],
    majorId: json["majorId"],
    major: json["major"] == null ? null : Major.fromJson(json["major"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "detail": detail,
    "image": image,
    "majorId": majorId,
    "major": major == null ? null : major!.toJson(),
  };
}
