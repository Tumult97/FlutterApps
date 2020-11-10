import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:pav_telecoms/models/common/pinnedVendorVoucherCount.dart';
import 'package:pav_telecoms/models/quickSaleDenomination.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuickSale extends StatefulWidget {
  LoginResponse permissions;
  List<QuickSaleDenomination> denominations = [];

  QuickSale(LoginResponse permissions){
    this.permissions = permissions;
    permissions.vendorVoucherCounts.forEach((PinnedVendorVoucherCount element) {
      switch(element.vendorId){
        case 1:
          denominations.addAll(
              [QuickSaleDenomination(description: "Vodacom R5", productId: 38, icon: "vodacom", value: "5.00"),
                QuickSaleDenomination(description: "Vodacom R12", productId: 29, icon: "vodacom", value: "12.00"),
                QuickSaleDenomination(description: "Vodacom R29", productId: 30, icon: "vodacom", value: "29.00"),]
          );
          break;
        case 2:
          denominations.addAll(
              [QuickSaleDenomination(description: "MTN R5", productId: 14, icon: "mtn", value: "5.00"),
                QuickSaleDenomination(description: "MTN R10", productId: 15, icon: "mtn", value: "10.00"),
                QuickSaleDenomination(description: "MTN R15", productId: 16, icon: "mtn", value: "15.00"),]
          );
          break;
        case 3:
          denominations.addAll(
              [QuickSaleDenomination(description: "CellC R5", productId: 1, icon: "cellc", value: "5.00"),
                QuickSaleDenomination(description: "CellC R10", productId: 2, icon: "cellc", value: "10.00"),
                QuickSaleDenomination(description: "CellC R25", productId: 3, icon: "cellc", value: "25.00"),]
          );
          break;
        case 23:
          denominations.addAll(
              [QuickSaleDenomination(description: "Telkom R5", productId: 57, icon: "telkom", value: "5.00"),
                QuickSaleDenomination(description: "Telkom R10", productId: 58, icon: "telkom", value: "10.00"),
                QuickSaleDenomination(description: "Telkom R20", productId: 59, icon: "telkom", value: "20.00"),]
          );
          break;
      }
    });
  }

  @override
  _QuickSaleState createState() => _QuickSaleState(denominations);
}

class _QuickSaleState extends State<QuickSale> {

  List<QuickSaleDenomination> denominations = [];

  _QuickSaleState(List<QuickSaleDenomination> list){
    denominations = list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: GridView.count(
          crossAxisCount: 3,
          children: generateGrid(denominations, context),
          padding: EdgeInsets.all(0.0),
          //mainAxisSpacing: 30.0,
          scrollDirection: Axis.vertical,
          childAspectRatio: 1.1,
        ),
      ),
    );
    // return Scaffold(
    //   body: Container(
    //     child: SliverGrid.count(
    //       crossAxisCount: 1,
    //       children: generateGrid(denominations, context),
    //     ),
    //   )
    // );
  }

  List<Widget> generateGrid(List<QuickSaleDenomination> list, context){
    List<Widget> result = List();
    list.forEach((element) {
      result.add(Center(
        child: FlatButton(
          onPressed: () {
            //showItemSnackbar(element, context);
            _openPopup(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image.asset(
                    "assets/icons/${element.icon}.png",
                    width: MediaQuery.of(context).size.width * 0.24,
                  ),
                ),
              ),
              Center(child: Text(element.description,))
            ],
          ),
        ),
      ),);
    });
    return result;
  }

  void showItemSnackbar(QuickSaleDenomination element, context){
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(element.description)
        ],
      ),
      duration: Duration(milliseconds: 1000),
      elevation: 30.0,
      behavior: SnackBarBehavior.floating,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _openPopup(context) async {
    FlutterBlue flutterBlue = FlutterBlue.instance;

    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    // Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });

    // Stop scanning
    flutterBlue.stopScan();

    Alert(
        context: context,
        title: "Test",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Username',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
