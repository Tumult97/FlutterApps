import 'package:flutter/material.dart';
import 'package:pav_telecoms/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
    },
  ));
}