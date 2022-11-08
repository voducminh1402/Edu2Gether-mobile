import 'dart:convert';

List<Payment> paymentFromJson(String str) => List<Payment>.from(json.decode(str).map((x) => Payment.fromJson(x)));

String paymentToJson(List<Payment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Payment {
  int id;
  String? paypalId;
  int bookingId;
  double? totalPrice;
  String? status;
  String? paymentType;
  String? failReason;

  Payment({
    required this.id,
    this.paypalId,
    required this.bookingId,
    this.totalPrice,
    this.status,
    this.paymentType,
    this.failReason,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    paypalId: json["paypalId"],
    bookingId: json["bookingId"],
    totalPrice: json["totalPrice"],
    status: json["status"],
    paymentType: json["paymentType"],
    failReason: json["failReason"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "paypalId": paypalId,
    "bookingId": bookingId,
    "totalPrice": totalPrice,
    "status": status,
    "paymentType": paymentType,
    "failReason": failReason,
  };
}