import 'package:flutter/material.dart';
import 'package:world_time_ui/pages/home.dart';
import 'package:world_time_ui/pages/choose_location.dart';
import 'package:world_time_ui/pages/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/location':(context) => ChooseLocation(),
  },
));
