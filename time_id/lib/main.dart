import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeCard(),
  ));
}

class HomeCard extends StatefulWidget {
  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {

  //region Variables
  int level = 0;
  //endregion

  //region Home Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[900],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            level++;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal[900],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/avataaars.png"),
                backgroundColor: Colors.transparent,
                radius: 50.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            Text(
              "NAME",
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              "Tristan",
              style: TextStyle(
                color: Colors.teal[600],
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0,),
            Text(
              "CURRENT USER LEVEL",
              style: TextStyle(
              color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              "$level",
              style: TextStyle(
                color: Colors.teal[600],
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[600]
                ),
                SizedBox(width: 10.0,),
                Text(
                  "tristan@netgen.co.za",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  //endregion
}

