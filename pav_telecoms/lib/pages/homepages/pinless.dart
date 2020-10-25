import 'package:flutter/material.dart';
import 'package:pav_telecoms/models/pinlessIcon.dart';

class Pinless extends StatefulWidget {
  List<PinlessIcon> list = [];

  Pinless(permissions){
    list.add(PinlessIcon(name: "Vodacom", icon: "vodacom", network: "vodacom"));
    list.add(PinlessIcon(name: "MTN", icon: "mtn", network: "mtn"));
    list.add(PinlessIcon(name: "Cell C", icon: "cellc", network: "cellc"));
    list.add(PinlessIcon(name: "Telkom", icon: "telkom", network: "telkom"));
    list.add(PinlessIcon(name: "Virgin", icon: "virgin", network: "virgin"));
    list.add(PinlessIcon(name: "DSTV", icon: "dstv", network: "dstv"));
    list.add(PinlessIcon(name: "Electricity", icon: "electricity", network: "electricity"));
  }

  @override
  _PinlessState createState() => _PinlessState(list);
}

class _PinlessState extends State<Pinless> {

  List<PinlessIcon> list = [];

  _PinlessState(List<PinlessIcon> list){
    this.list = list;
    //super.initState();
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
