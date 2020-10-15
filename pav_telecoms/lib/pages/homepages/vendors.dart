import 'package:flutter/material.dart';
import 'package:pav_telecoms/models/vendor.dart';

class Vendors extends StatefulWidget {
  List<Vendor> vendorList = [];

  Vendors(permissions){
    vendorList.add(Vendor(name: "Vodacom", data: false, icon: "vodacom", network: "vodacom", dataIcon: ""));
    vendorList.add(Vendor(name: "Vodacom Data", data: true, icon: "vodacom", network: "vodacom", dataIcon: "-data"));
    vendorList.add(Vendor(name: "MTN", data: false, icon: "mtn", network: "mtn", dataIcon: ""));
    vendorList.add(Vendor(name: "MTN Data", data: true, icon: "mtn", network: "mtn", dataIcon: "-data"));
    vendorList.add(Vendor(name: "Cell C", data: false, icon: "cellc", network: "cellc", dataIcon: ""));
    vendorList.add(Vendor(name: "Cell C Data", data: true, icon: "cellc", network: "cellc", dataIcon: "-data"));
    vendorList.add(Vendor(name: "Telkom", data: false, icon: "telkom", network: "telkom", dataIcon: ""));
    vendorList.add(Vendor(name: "Telkom Data", data: true, icon: "telkom", network: "telkom", dataIcon: "-data"));
    vendorList.add(Vendor(name: "Lotto", data: false, icon: "lotto", network: "lotto", dataIcon: ""));
    vendorList.add(Vendor(name: "Virgin", data: false, icon: "virgin", network: "virgin", dataIcon: ""));
    vendorList.add(Vendor(name: "Electricity", data: false, icon: "electricity", network: "electricity", dataIcon: ""));
    vendorList.add(Vendor(name: "Rise Telecoms", data: false, icon: "rise", network: "risetelecoms", dataIcon: ""));
    vendorList.add(Vendor(name: "OTT Mobile", data: false, icon: "pav", network: "ottmobile", dataIcon: ""));
    vendorList.add(Vendor(name: "Neotel", data: false, icon: "neotel", network: "neotel", dataIcon: ""));
    vendorList.add(Vendor(name: "PAV Test", data: false, icon: "pav", network: "pav", dataIcon: ""));
  }

  @override
  _VendorsState createState() => _VendorsState(vendorList);
}

class _VendorsState extends State<Vendors> {
  List<Vendor> vendorList = [];

  _VendorsState(List<Vendor> list){
    vendorList = list;
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 0.0),
        child: GridView.count(
          crossAxisCount: 4,
          padding: EdgeInsets.all(0.0),
          mainAxisSpacing: 30.0,
          scrollDirection: Axis.vertical,
          children: generateGrid(vendorList, context),
        ),
      ),
    );
  }

  List<Widget> generateGrid(List<Vendor> list, context){
    List<Widget> result = <Widget>[];
    list.forEach((element) {
      result.add(Center(
        child: InkWell(
          onTap: () {
            showItemSnackbar(element, context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Image.asset(
                  "assets/icons/${element.icon}${element.dataIcon}.png",
                  width: MediaQuery.of(context).size.width * 0.20,
                ),
              ),
              SizedBox(height: 5.0,),
              Text("${element.name}")
            ],
          ),
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
