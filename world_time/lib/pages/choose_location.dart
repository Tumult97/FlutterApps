import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print("build function ran");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 20.0,
      ),
      body: SafeArea(
          child: RaisedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: Text("$counter"),
          ),
      ),
    );
  }
}
