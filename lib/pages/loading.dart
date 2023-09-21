import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time_ui/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setWorldTime() async{
    WorldTime instance = WorldTime('Colombo',"3.14", 'srilanka.png' ,'Asia/Colombo', true);
    await instance.getTime();
    print(instance);
    Navigator.pushReplacementNamed(context , '/home' , arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 120.0,
          borderWidth: 12.0,
        ),
      ),
    );
  }
}
