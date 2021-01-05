import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pav_telecoms/models/responses/balanceResponse.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';
import 'package:pav_telecoms/code/connection.dart' as api;
import 'package:ticketview/ticketview.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';

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
    terminalId = arguments["terminal"];
    permissions = LoginResponse.fromJson(permissionsMap);

    return Scaffold(
      appBar: AppBar(
        title: Text("Balance Summary"),
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

            List<Widget> ticketWidgets = [
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
              SizedBox(height: 20,),
              Center(
                  child: Text(
                    permissions.clientName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Table(
                //border: TableBorder.all(),
                children: <TableRow>[
                  TableRow(
                      children: [
                        Text("Time:"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(DateFormat("yyyy/mm/dd hh:mm").format(response.timestamp)),
                          ],
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Credit:"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(response.creditLimit.toString()),
                          ],
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Available:"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(response.available.toString()),
                          ],
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Opening:"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(response.openingBalance.toString()),
                          ],
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Closing:"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(response.closingBalance.toString()),
                          ],
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Sales:"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(response.vouchers.toString()),
                          ],
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Deposits:"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(response.deposits.toString()),
                          ],
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Adjustments:"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(response.adjustments.toString()),
                          ],
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Fees:"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(response.fees.toString()),
                          ],
                        ),
                      ]
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Center(
                child: Text("Last 3 Deposits"),
              ),
              Divider(
                color: Colors.black,
              ),
            ];
            
            response.latestDeposits.forEach((element) { 
              ticketWidgets.add(
                  Table(
                    //border: TableBorder.all(),
                    children: <TableRow>[
                      TableRow(
                          children: [
                            Text("Ref:"),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(element.reference),
                              ],
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            Text("Credit:"),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("R" + element.amount.toString()),
                              ],
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            Text("Available:"),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(DateFormat("yyyy-mm-dd").format(element.created)),
                                //Text(element.created.toString())
                              ],
                            ),
                          ]
                      ),
                    ],
                  )
              );

              ticketWidgets.add(Divider(
                color: Colors.black,
              ),);
            });

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
                              children: ticketWidgets,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void showItemSnackbar(String element, context){
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(element)
        ],
      ),
      duration: Duration(milliseconds: 1000),
      elevation: 30.0,
      behavior: SnackBarBehavior.floating,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void printVoucher(){
    var breaker = "--------------------------------";
    bluetooth.printCustom(breaker, 1, 1);
    bluetooth.printCustom("Account Balance", 3, 1);
    bluetooth.printCustom(breaker, 1, 1);

    bluetooth.printNewLine();

    bluetooth.printCustom(permissions.clientName, 0, 1);
    bluetooth.printLeftRight("Time:", DateFormat("yyyy/mm/dd hh:mm").format(response.timestamp), 1);
    bluetooth.printLeftRight("Credit:", response.creditLimit.toString(), 0);
    bluetooth.printLeftRight("Available:", response.available.toString(), 0);
    bluetooth.printLeftRight("Opening:", response.openingBalance.toString(), 0);
    bluetooth.printLeftRight("Closing:", response.closingBalance.toString(), 0);
    bluetooth.printLeftRight("Sales:", response.vouchers.toString(), 0);
    bluetooth.printLeftRight("Deposits:", response.deposits.toString(), 0);
    bluetooth.printLeftRight("Adjustments:", response.adjustments.toString(), 0);
    bluetooth.printLeftRight("Fees:", response.fees.toString(), 0);

    bluetooth.printNewLine();

    bluetooth.printCustom(breaker, 1, 1);
    bluetooth.printCustom("Last 3 Deposits", 0, 1);
    bluetooth.printCustom(breaker, 1, 1);

    response.latestDeposits.forEach((element) {
      bluetooth.printLeftRight("Ref:", element.reference, 0);
      bluetooth.printLeftRight("Amount:", "R" + element.amount.toString(), 0);
      bluetooth.printLeftRight("Date:", DateFormat("yyyy-mm-dd").format(element.created), 0);
      bluetooth.printCustom(breaker, 1, 1);
    });

    bluetooth.printNewLine();
    bluetooth.printNewLine();
    bluetooth.printNewLine();
    bluetooth.printNewLine();
  }
}
