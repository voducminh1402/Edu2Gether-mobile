// To parse this JSON data, do
//
//     final mentee = menteeFromJson(jsonString);

import 'dart:convert';

List<Mentee> menteeFromJson(String str) => List<Mentee>.from(json.decode(str).map((x) => Mentee.fromJson(x)));

String menteeToJson(List<Mentee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mentee {
  Mentee({
    required this.id,
    this.fullName,
    this.phone,
    this.address,
    this.university,
    this.country,
    this.gender,
    this.image,
  });

  String id;
  String? fullName;
  String? phone;
  String? address;
  String? university;
  String? country;
  String? gender;
  String? image;

  factory Mentee.fromJson(Map<String, dynamic> json) => Mentee(
    id: json["id"],
    fullName: json["fullName"],
    phone: json["phone"],
    address: json["address"],
    university: json["university"],
    country: json["country"],
    gender: json["gender"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "phone": phone,
    "address": address,
    "university": university,
    "country": country,
    "gender": gender,
    "image": image,
  };
}
