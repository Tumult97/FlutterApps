import 'dart:ui';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
  List<BluetoothDevice> _devices = [];
  BluetoothDevice _device;
  bool _connected = false;

  @override
  void initState(){
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool isConnected=await bluetooth.isConnected;
    List<BluetoothDevice> devices = [];
    setState(() {
      _connected = isConnected;
    });
    if(isConnected){
      print('Already connected');
      return;
    }
    try {
      devices = await bluetooth.getBondedDevices();
      if(devices.length == 0){
        return;
      }
      bluetooth.connect(devices[0]);
      //showItemSnackbar("Connected", context);
    } on PlatformException {
      print('Already connected');
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
          });
          break;
        default:
        //print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });

    if(isConnected) {
      setState(() {
        _connected=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    permissionsMap = arguments["permissions"];
    terminalId = permissionsMap["terminal"];
    report = "";
    permissions = LoginResponse.fromJson(permissionsMap["permissions"]);

    dateTo = arguments["dateTo"];
    dateFrom = arguments["dateFrom"];

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

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  slip,
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    color: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.0),
                    ),
                    child: Text(
                      "PRINT",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: !_connected ? null : printVoucher,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void printVoucher(){
    response.report.forEach((element) {
      bluetooth.printCustom(element.text, 0, element.centered ? 1 : 0);
    });

    bluetooth.printNewLine();
    bluetooth.printNewLine();
    bluetooth.printNewLine();
    bluetooth.printNewLine();
  }
}

