import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';
import 'package:pav_telecoms/models/vendor.dart';
import 'package:permission_handler/permission_handler.dart';

class Vendors extends StatelessWidget {
  List<Vendor> vendorList = [];
  final List<Map<String, dynamic>> data = List();

  Vendors(LoginResponse permissions){

    permissions.vendorVoucherCounts.forEach((element) {
      switch(element.vendorId) {
        case 1:
          vendorList.add(Vendor(name: "Vodacom", data: false, icon: "vodacom", network: 1, dataIcon: ""));
          vendorList.add(Vendor(name: "Vodacom Data", data: true, icon: "vodacom", network: 1, dataIcon: "-data"));
          break;
        case 2:
          vendorList.add(Vendor(name: "MTN", data: false, icon: "mtn", network: 2, dataIcon: ""));
          break;
        case 26:
          vendorList.add(Vendor(name: "MTN Data", data: true, icon: "mtn", network: 26, dataIcon: "-data"));
          break;
        case 3:
          vendorList.add(Vendor(name: "Cell C", data: false, icon: "cellc", network: 3, dataIcon: ""));
          vendorList.add(Vendor(name: "Cell C Data", data: true, icon: "cellc", network: 3, dataIcon: "-data"));
          break;
        case 23:
          vendorList.add(Vendor(name: "Telkom", data: false, icon: "telkom", network: 23, dataIcon: ""));
          break;
        case 4:
          vendorList.add(Vendor(name: "Telkom Data", data: true, icon: "telkom", network: 4, dataIcon: "-data"));
          break;
        case 13:
          vendorList.add(Vendor(name: "Virgin", data: false, icon: "virgin", network: 13, dataIcon: ""));
          break;
        case 29:
          vendorList.add(Vendor(name: "Neotel", data: false, icon: "neotel", network: 29, dataIcon: ""));
          break;
        case 12:
          vendorList.add(Vendor(name: "PAV Test", data: false, icon: "pav", network: 12, dataIcon: ""));
          break;
      }
    });

    if(permissions.electricityActive){
      vendorList.add(Vendor(name: "Electricity", data: false, icon: "electricity", network: -1, dataIcon: ""));
    }

    if(permissions.mabonengVoucherCount){
      vendorList.add(Vendor(name: "Rise", data: false, icon: "rise", network: 0, dataIcon: ""));
    }

    if(permissions.allowLotto && permissions.manufacturer == "SUNMI"){
      vendorList.add(Vendor(name: "Lotto", data: false, icon: "lotto", network: -1, dataIcon: ""));
    }

    if(permissions.allowOTTVend){
      vendorList.add(Vendor(name: "OTT Mobile", data: false, icon: "pav", network: 0, dataIcon: ""));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: GridView.count(
          crossAxisCount: 4,
          padding: EdgeInsets.all(0.0),
          scrollDirection: Axis.vertical,
          children: generateGrid(vendorList, context),
          childAspectRatio: 0.95,
        ),
      ),
    );
  }

  List<Widget> generateGrid(List<Vendor> list, context){
    List<Widget> result = <Widget>[];
    list.forEach((element) {
      result.add(FlatButton(
        onPressed: () async {
          //showItemSnackbar(element, context);
          //_startPrint(_devices[0]);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icons/${element.icon}${element.dataIcon}.png",
              width: MediaQuery.of(context).size.width * 0.24,
            ),
            Center(
              child: Text(
                "${element.name}",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            )
          ],
        ),
      ));
    });

    return result;
  }

  void showItemSnackbar(Vendor element, context){
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(element.name)
        ],
      ),
      duration: Duration(milliseconds: 1000),
      elevation: 30.0,
      behavior: SnackBarBehavior.floating,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
