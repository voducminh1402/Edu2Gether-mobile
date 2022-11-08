// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

List<Booking> bookingFromJson(String str) => List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  Booking({
    required this.id,
    required this.mentorId,
    required this.menteeId,
    required this.courseId,
    required this.bookingTime,
    required this.status,
    required this.coursePrice,
    this.canceledBy,
    this.canceledReason,
    this.rating,
    this.comment,
    this.feedbackTime,
    this.slotId,
  });

  int id;
  String mentorId;
  String menteeId;
  int courseId;
  DateTime bookingTime;
  String status;
  double coursePrice;
  String? canceledBy;
  String? canceledReason;
  int? rating;
  String? comment;
  DateTime? feedbackTime;
  int? slotId;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"],
    mentorId: json["mentorId"],
    menteeId: json["menteeId"],
    courseId: json["courseId"],
    bookingTime: DateTime.parse(json["bookingTime"]),
    status: json["status"],
    coursePrice: json["coursePrice"],
    canceledBy: json["canceledBy"],
    canceledReason: json["canceledReason"],
    rating: json["rating"],
    comment: json["comment"],
    feedbackTime: json["feedbackTime"] == null ? null : DateTime.parse(json["feedbackTime"]),
    slotId: json["slotId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mentorId": mentorId,
    "menteeId": menteeId,
    "courseId": courseId,
    "bookingTime": bookingTime.toIso8601String(),
    "status": status,
    "coursePrice": coursePrice,
    "canceledBy": canceledBy,
    "canceledReason": canceledReason,
    "rating": rating,
    "comment": comment,
    "feedbackTime": feedbackTime == null ? null : feedbackTime!.toIso8601String(),
    "slotId": slotId,
  };
}
