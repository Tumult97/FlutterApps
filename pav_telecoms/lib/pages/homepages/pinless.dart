import 'package:flutter/material.dart';
import 'package:pav_telecoms/models/pinlessIcon.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';

class Pinless extends StatelessWidget {
  List<PinlessIcon> list = [];

  Pinless(LoginResponse permissions){
    permissions.smartCallVoucherCounts.forEach((element) {
      switch(element.network){
        case "Vodacom":
          if(element.count > 0){
            list.add(PinlessIcon(name: "Vodacom", icon: "vodacom", network: 1));
          }
          break;
        case "MTN":
          if(element.count > 0){
            list.add(PinlessIcon(name: "MTN", icon: "mtn", network: 2));
          }
          break;
        case "Cell C":
          if(element.count > 0){
            list.add(PinlessIcon(name: "Cell C", icon: "cellc", network: 3));
          }
          break;
        case "Telkom Mobile":
          if(element.count > 0){
            list.add(PinlessIcon(name: "Telkom", icon: "telkom", network: 9));
          }
          break;
        case "Virgin Mobile":
          if(element.count > 0){
            list.add(PinlessIcon(name: "Virgin", icon: "virgin", network: 12));
          }
          break;
        case "":
          list.add(PinlessIcon(name: "Vodacom", icon: "vodacom", network: 1));
          list.add(PinlessIcon(name: "MTN", icon: "mtn", network: 2));
          list.add(PinlessIcon(name: "Cell C", icon: "cellc", network: 3));
          list.add(PinlessIcon(name: "Telkom", icon: "telkom", network: 9));
          list.add(PinlessIcon(name: "Virgin", icon: "virgin", network: 12));
          break;
      }
    });

    if(permissions.allowDSTV){
      list.add(PinlessIcon(name: "DSTV", icon: "dstv", network: 99));
    }

    if(permissions.allowPinlessElectrivityVending){
      list.add(PinlessIcon(name: "Electricity", icon: "electricity", network: -1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: GridView.count(
            crossAxisCount: 3,
            scrollDirection: Axis.vertical,
            children: generateGrid(list, context),
            childAspectRatio: 1.1
        ),
      ),
    );
  }

  List<Widget> generateGrid(List<PinlessIcon> list, context){
    List<Widget> result = <Widget>[];

    list.forEach((element) {
      result.add(Center(
        child: FlatButton(
          onPressed: () {
            showItemSnackbar(element, context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Image.asset(
                  "assets/icons/${element.icon}.png",
                  width: MediaQuery.of(context).size.width * 0.24,
                ),
              ),
              Text("${element.name}")
            ],
          ),
        ),
      ));
    });

    return result;
  }

  void showItemSnackbar(PinlessIcon element, context){
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
