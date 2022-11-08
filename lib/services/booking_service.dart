import 'dart:convert';
import 'dart:developer';

import 'package:edu2gether_mobile/models/booking.dart';
import 'package:edu2gether_mobile/models/payment.dart';
import 'package:edu2gether_mobile/services/payment_service.dart';
import 'package:edu2gether_mobile/utilities/path.dart';
import 'package:http/http.dart' as http;

class BookingService{
  Future<Booking?> createBooking(Booking booking) async{
    try{
      var url = Uri.parse(Path.path + "/bookings");
      var response = await http.post(url,
            headers: {
              "accept": "text/plain",
              "Content-Type": "application/json"
            },
            body: jsonEncode(booking)
        );

      if(response.statusCode == 201){
        Booking _booking = Booking.fromJson(jsonDecode(response.body));

        return _booking;
      }
    }
    catch(e)
    {
      print(e.toString());
      log(e.toString());
    }
  }
  Future<Booking?> getBookingById(id) async{
    try{
      var url = Uri.parse(Path.path+ "/bookings/"+id.toString());
      var response = await http.get(url);
      if(response.statusCode == 200){
        Booking _booking = Booking.fromJson(jsonDecode(response.body));
        return _booking;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }
}