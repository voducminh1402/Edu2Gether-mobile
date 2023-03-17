// To parse this JSON data, do
//
//     final AuthenResponse = AuthenResponseFromJson(jsonString);

import 'dart:convert';

AuthenResponse AuthenResponseFromJson(String str) =>
    AuthenResponse.fromJson(json.decode(str));

String AuthenResponseToJson(AuthenResponse data) => json.encode(data.toJson());

class AuthenResponse {
  AuthenResponse({
    required this.accessToken,
    required this.id,
    required this.isFirstLogin,
    required this.isConfirmedInfo,
    this.phone,
    this.image,
    required this.name,
    required this.email,
    required this.role,
  });

  String accessToken;
  String id;
  bool isFirstLogin;
  bool isConfirmedInfo;
  String? phone;
  String? image;
  String name;
  String email;
  String role;

  factory AuthenResponse.fromJson(Map<String, dynamic> json) => AuthenResponse(
        accessToken: json["accessToken"],
        id: json["id"],
        isFirstLogin: json["isFirstLogin"],
        isConfirmedInfo: json["isConfirmedInfo"],
        phone: json["phone"],
        image: json["image"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "id": id,
        "isFirstLogin": isFirstLogin,
        "isConfirmedInfo": isConfirmedInfo,
        "phone": phone,
        "image": image,
        "name": name,
        "email": email,
        "role": role,
      };
}
