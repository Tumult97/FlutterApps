import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pav_telecoms/models/responses/salesSummaryResponse.dart';
import 'package:pav_telecoms/code/connection.dart' as api;
import 'package:ticketview/ticketview.dart';

class SalesSummary extends StatefulWidget {
  @override

  _SalesSummaryState createState() => _SalesSummaryState();
}

class _SalesSummaryState extends State<SalesSummary> {
  SalesSummaryResponse response;
  Map permissionsMap = {};
  String terminalId = "";
  Widget slip;
  var report = "";

  @override
  Widget build(BuildContext context) {
    permissionsMap = ModalRoute.of(context).settings.arguments;
    terminalId = permissionsMap["terminal"];

    report = "";

    return Scaffold(
      appBar: AppBar(
        title: Text("Sales Summary"),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<SalesSummaryResponse>(
        future: api.Connection.salesSummary(terminalId),
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

            return Padding(
              padding: const EdgeInsets.all(50.0),
              child: TicketView(
                contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 0),
                contentBackgroundColor: Colors.grey[200],
                drawArc: false,
                drawTriangle: false,
                drawShadow: true,
                drawBorder: true,
                triangleAxis: Axis.vertical,
                drawDivider: false,
                child: Container(
                  color: Colors.red,
                  child: ListView.builder(
                    itemCount: response.report.length,
                    itemBuilder: (context, index){
                      print(response.report[index].text);
                      return Text(
                        response.report[index].text.trim(),
                        style: TextStyle(
                            backgroundColor: Colors.red,
                            color: Colors.blue
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

