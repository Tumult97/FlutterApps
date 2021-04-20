import 'package:flutter/material.dart';
import 'package:pav_telecoms/models/responses/loginResponse.dart';
import 'package:pav_telecoms/pages/homepages/pinless.dart';
import 'package:pav_telecoms/pages/homepages/quickSale.dart';
import 'package:pav_telecoms/pages/homepages/vendors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> menuItems = ['Balance', 'Reports', 'Reprint', "Printer", "Logout"];
  Map permissionsMap = {};
  LoginResponse permissions;


  @override
  Widget build(BuildContext context) {
    permissionsMap = ModalRoute.of(context).settings.arguments;
    permissions = LoginResponse.fromJson(permissionsMap);

    if(permissions.allowWalletTransfer){
      menuItems.insert(4, "Wallet To Wallet");
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return menuItems.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
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
          title: Image.asset(
            "assets/images/pav.png",
            height: 40.0,
          ),
          backgroundColor: Colors.blue[600],
        ),
        body: TabBarView(
          children: [
            QuickSale(5),
            Vendors(5),
            Pinless(5),
          ],
        ),
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  // void setUpPrefs() async {
  //   prefs = await SharedPreferences.getInstance();
  // }
}

