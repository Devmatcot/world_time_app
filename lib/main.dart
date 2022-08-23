

import 'package:flutter/material.dart';
import 'package:world_app/pages/loading.dart';
import 'pages/choose location.dart';
import 'pages/home.dart';
import 'pages/reload_location.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: "/loading",
  routes: {
    "/home":(context) => Home(),
    "/choose_location": (context) => ChooseLocation(),
    "/loading": (context) => Loading(),
    "/reload": (context) => Demo()
},));



