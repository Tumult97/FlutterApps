import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';
import 'package:pav_telecoms/models/responses/salesSummaryResponse.dart';
import 'package:pav_telecoms/code/connection.dart' as api;
import 'package:ticketview/ticketview.dart';

class SalesSummary extends StatefulWidget {
  @override

  _SalesSummaryState createState() => _SalesSummaryState();
}

class _SalesSummaryState extends State<SalesSummary> {
  SalesSummaryResponse response;
  Map arguments = {};
  Map permissionsMap = {};
  String terminalId = "";
  Widget slip;
  DateTime dateFrom;
  DateTime dateTo;
  LoginResponse permissions;
  var report = "";

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    permissionsMap = arguments["permissions"];
    terminalId = permissionsMap["terminal"];
    report = "";
    permissions = LoginResponse.fromJson(permissionsMap["permissions"]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sales Summary"),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<SalesSummaryResponse>(
        future: api.Connection.salesSummary(terminalId, dateFrom, dateTo, permissions.userId),
        builder: (BuildContext context, AsyncSnapshot<SalesSummaryResponse> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            report = "";
            response = snapshot.data;
            if(!response.status.success){
              return Center(
                child: Text(response.status.message),
              );
            }

            response.report.forEach((element) {
              if(element.centered){
                report += "\t\t\t\t\t\t" + element.text + "\n";
              }
              else{
                report += element.text + "\n";
              }
            });

            slip = Center(
              child: Container(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TicketView(
                      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 0),
                      drawArc: false,
                      contentBackgroundColor: Colors.grey[200],
                      triangleAxis: Axis.vertical,
                      borderRadius: 6,
                      drawDivider: true,
                      dividerColor: Colors.grey[200],
                      drawTriangle: false,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                report,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFeatures: [
                                    FontFeature.tabularFigures()
                                  ],
                                  fontFamily: "monospace",
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                slip,
                RaisedButton(
                  onPressed: () {},
                  child: Text("Print"),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

