import 'package:flutter/material.dart';
import 'package:pav_telecoms/models/quickSaleDenomination.dart';

class QuickSale extends StatelessWidget {
  int counter = 0;

  List<QuickSaleDenomination> denominations = [
    QuickSaleDenomination(description: "Vodacom R5", productId: 01, icon: "vodacom", value: "5.00"),
    QuickSaleDenomination(description: "Vodacom R12", productId: 02, icon: "vodacom", value: "5.00"),
    QuickSaleDenomination(description: "Vodacom R29", productId: 03, icon: "vodacom", value: "5.00"),
    QuickSaleDenomination(description: "MTN R5", productId: 04, icon: "mtn", value: "5.00"),
    QuickSaleDenomination(description: "MTN R10", productId: 05, icon: "mtn", value: "5.00"),
    QuickSaleDenomination(description: "MTN R15", productId: 06, icon: "mtn", value: "5.00"),
    QuickSaleDenomination(description: "CellC R5", productId: 07, icon: "cellc", value: "5.00"),
    QuickSaleDenomination(description: "CellC R10", productId: 08, icon: "cellc", value: "5.00"),
    QuickSaleDenomination(description: "CellC R25", productId: 09, icon: "cellc", value: "5.00"),
    QuickSaleDenomination(description: "Telkom R5", productId: 10, icon: "telkom", value: "5.00"),
    QuickSaleDenomination(description: "Telkom R10", productId: 11, icon: "telkom", value: "5.00"),
    QuickSaleDenomination(description: "Telkom R20", productId: 12, icon: "telkom", value: "5.00"),
  ];

  QuickSale(num){
    counter = num;
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
          mainAxisSpacing: 30.0,
          scrollDirection: Axis.vertical,
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
        child: InkWell(
          onTap: () {
            showItemSnackbar(element, context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  "assets/icons/${element.icon}.png",
                  width: MediaQuery.of(context).size.width * 0.28,
                ),
              ),
              SizedBox(height: 5.0,),
              Text(element.description,),
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
