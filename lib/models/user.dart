// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.email,
    required this.userName,
    required this.password,
    required this.isActived,
    required this.roleID,
    required this.isSystemAdmin,
  });

  String id;
  String email;
  String userName;
  String password;
  String isActived;
  int roleID;
  bool isSystemAdmin;


  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    userName: json["userName"],
    password: json["password"],
    isActived: json["isActived"],
    roleID: json["roleID"],
    isSystemAdmin: json["isSystemAdmin"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "userName": userName,
    "password": password,
    "isActived": isActived,
    "roleID": roleID,
    "isSystemAdmin": isSystemAdmin,
  };
}
