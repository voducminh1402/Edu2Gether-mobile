// To parse this JSON data, do
//
//     final mentor = mentorFromJson(jsonString);

import 'dart:convert';

List<Mentor> mentorFromJson(String str) => List<Mentor>.from(json.decode(str).map((x) => Mentor.fromJson(x)));

String mentorToJson(List<Mentor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mentor {
  Mentor({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.country,
    required this.qualification,
    this.evidence,
    required this.job,
    required this.gender,
    required this.image,
    this.websiteUrl
  });

  String id;
  String fullName;
  String phone;
  String address;
  String country;
  String qualification;
  String? evidence;
  String job;
  String gender;
  String image;
  String? websiteUrl;

  factory Mentor.fromJson(Map<String, dynamic> json) => Mentor(
    id: json["id"],
    fullName: json["fullName"],
    phone: json["phone"],
    address: json["address"],
    country: json["country"],
    qualification: json["qualification"],
    evidence: json["evidence"],
    job: json["job"],
    gender: json["gender"],
    image: json["image"],
    websiteUrl: json["websiteUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "phone": phone,
    "address": address,
    "country": country,
    "qualification": qualification,
    "evidence": evidence,
    "job": job,
    "gender": gender,
    "image": image,
    "websiteUrl": websiteUrl,
  };
}
