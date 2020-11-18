import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pav_telecoms/models/responses/balanceResponse.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';
import 'package:pav_telecoms/code/connection.dart' as api;
import 'package:ticketview/ticketview.dart';

class Balance extends StatefulWidget {
  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  Map arguments = {};
  Map permissionsMap = {};
  String terminalId = "";
  Widget slip;
  DateTime dateFrom;
  DateTime dateTo;
  LoginResponse permissions;
  BalanceResponse response;

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    permissionsMap = arguments["permissions"];
    terminalId = arguments["terminal"];
    permissions = LoginResponse.fromJson(permissionsMap);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sales Summary"),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<BalanceResponse>(
        future: api.Connection.balance(terminalId, permissions.clientId),
        builder: (BuildContext context, AsyncSnapshot<BalanceResponse> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            response = snapshot.data;
            if(!response.status.success){
              return Center(
                child: Text(response.status.message),
              );
            }

            slip = Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
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
                                Divider(
                                  color: Colors.black,
                                ),
                                Center(
                                  child: Text(
                                    "Account Balance",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "monospace"
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Text(permissions.clientName),
                                Table(
                                  //border: TableBorder.all(),
                                  children: <TableRow>[
                                    TableRow(
                                      children: [
                                        Text("Time:"),
                                        Text(DateFormat("yyyy/mm/dd hh:mm").format(response.timestamp)),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Credit:"),
                                        Text(response.creditLimit.toString()),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Available:"),
                                        Text(response.available.toString()),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Opening:"),
                                        Text(response.openingBalance.toString()),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Closing:"),
                                        Text(response.closingBalance.toString()),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Sales:"),
                                        Text(response.vouchers.toString()),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Deposits:"),
                                        Text(response.deposits.toString()),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Adjustments:"),
                                        Text(response.adjustments.toString()),
                                      ]
                                    ),
                                    TableRow(
                                      children: [
                                        Text("Fees:"),
                                        Text(response.fees.toString()),
                                      ]
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
