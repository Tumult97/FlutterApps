import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    print(data);

    String image = data["isDayTime"] ? "day" : "night";
    Color bgColor = data["isDayTime"] ? Colors.blue[300] : Color.fromARGB(255, 40, 39, 98);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/night.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, "/location");
                      setState(() {
                        data = {
                          "time": result["time"],
                          "location": result["location"],
                          "flag": result["flag"],
                          "isDayTime": result["isDayTime"]
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: data["isDayTime"] ? Colors.white : Colors.white,
                    ),
                    label: Text(
                        "Change Location",
                      style: TextStyle(
                        color: data["isDayTime"] ? Colors.white : Colors.white
                      ),
                    )
                  ),
                  //SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data["location"],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: data["isDayTime"] ? Colors.white : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    data["time"],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: data["isDayTime"] ? Colors.white : Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
