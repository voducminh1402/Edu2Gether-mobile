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
    this.updatedTime,
    required this.paymentId,
    required this.description,
    required this.status,
    required this.amount,
    required this.walletId,
  });

  int id;
  DateTime createdTime;
  DateTime? updatedTime;
  int paymentId;
  String description;
  String status;
  num amount;
  int walletId;


  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    createdTime: DateTime.parse(json["createdTime"]),
    updatedTime: json["updatedTime"] == null ? null : DateTime.parse(json["updatedTime"]),
    paymentId: json["paymentId"],
    description: json["description"],
    status: json["status"],
    amount: json["amoun"],
    walletId: json["walletId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdTime": createdTime.toIso8601String(),
    "updatedTime": updatedTime == null ? null : updatedTime!.toIso8601String(),
    "paymentId": paymentId,
    "description": description,
    "status": status,
    "amoun": amount,
    "walletId": walletId,
  };
}
