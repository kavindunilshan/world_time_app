import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class WorldTime{

  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;


  WorldTime(this.location, this.time, this.flag, this.url, this.isDayTime);

  Future <void> getTime() async{

    try {
      http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);

      String datetime = data['utc_datetime'];
      String offset_hour = data['utc_offset'].substring(1, 3);
      String offset_minute = data['utc_offset'].substring(4, 6);
      String sign = data['utc_offset'].substring(0,1);


      DateTime now = DateTime.parse(datetime);

      now = sign == "+" ? now.add(Duration(
          hours: int.parse(offset_hour), minutes: int.parse(offset_minute))) :
      now.subtract(Duration(
          hours: int.parse(offset_hour), minutes: int.parse(offset_minute)));

      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);

    }

    catch(e){
      print("Error is : $e");
      time = "";
    }

  }

}