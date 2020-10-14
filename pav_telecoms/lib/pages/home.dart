import 'package:flutter/material.dart';
import 'package:pav_telecoms/pages/homepages/quickSale.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "QUICK SALE",
                //icon: Icon(Icons.monetization_on_outlined),
              ),
              Tab(
                text: "ALL VENDORS",
                //icon: Icon(Icons.storefront),
              ),
              Tab(
                text: "PINLESS",
                //icon: Icon(Icons.sim_card_outlined),
              ),
            ],
          ),
          title: Center(child: Text("PAV Telecoms")),
          backgroundColor: Colors.blue[900],
        ),
        body: TabBarView(
          children: [
            QuickSale(5),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}

