import 'package:flutter/material.dart';
import 'package:pav_telecoms/models/common/pinnedVendorVoucherCount.dart';
import 'package:pav_telecoms/models/quickSaleDenomination.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';

class QuickSale extends StatelessWidget {
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
  }

  List<Widget> generateGrid(List<QuickSaleDenomination> list, context){
    List<Widget> result = List();
    list.forEach((element) {
      result.add(Center(
        child: FlatButton(
          onPressed: () {
            //showItemSnackbar(element, context);
            showItemSnackbar(element, context);
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
}
