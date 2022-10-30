// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

List<Transaction> transactionFromJson(String str) => List<Transaction>.from(json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
  Transaction({
    required this.id,
    required this.createdTime,
    required this.updatedTime,
    required this.paymentId,
    required this.description,
    required this.status,
    required this.amoun,
    required this.walletId,
  });

  int id;
  String createdTime;
  String updatedTime;
  int paymentId;
  String description;
  String status;
  num amoun;
  int walletId;


  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    createdTime: json["createdTime"],
    updatedTime: json["updatedTime"],
    paymentId: json["paymentId"],
    description: json["description"],
    status: json["status"],
    amoun: json["amoun"],
    walletId: json["walletId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdTime": createdTime,
    "updatedTime": updatedTime,
    "paymentId": paymentId,
    "description": description,
    "status": status,
    "amoun": amoun,
    "walletId": walletId,
  };
}
