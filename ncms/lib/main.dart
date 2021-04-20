import 'package:flutter/material.dart';
import 'package:ncms/Pages/Dashboard/Overview.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Overview(),
      "/overview": (context) => Overview(),
    },
  ));
}

