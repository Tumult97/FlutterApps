import 'package:flutter/material.dart';
import 'package:pav_telecoms/pages/home.dart';
//import 'package:pav_telecoms/pages/home.dart';
import 'package:pav_telecoms/pages/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login(),
      "/home": (context) => Home(),
    },
  ));
}