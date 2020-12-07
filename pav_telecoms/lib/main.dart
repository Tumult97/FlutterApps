import 'package:flutter/material.dart';
import 'package:pav_telecoms/pages/home.dart';
import 'package:pav_telecoms/pages/login.dart';
import 'package:pav_telecoms/pages/reports/depositinformation.dart';
import 'package:pav_telecoms/pages/reports/reports.dart';
import 'package:pav_telecoms/pages/reports/salessummary.dart';
import 'package:pav_telecoms/pages/reports/salessummaryuser.dart';
import 'package:pav_telecoms/pages/single/balance.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login(),
      "/login": (context) => Login(),
      "/home": (context) => Home(),
      "/reports": (context) => Reports(),
      "/salessummary": (context) => SalesSummary(),
      "/salessummaryuser": (context) => SalesSummaryUser(),
      "/depositinfo": (context) => DepositInformation(),
      "/balance": (context) => Balance(),
    },
  ));
}