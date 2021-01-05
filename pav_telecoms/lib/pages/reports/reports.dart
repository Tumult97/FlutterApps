import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  Map permissionsMap;

  @override
  Widget build(BuildContext context) {
    DateTime dateFrom = DateTime.now().add(new Duration(days: -7));
    DateTime dateTo = DateTime.now();
    permissionsMap = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Reports"),
      ),
      body: Column(
        children: <Widget>[
          DateTimePicker(
            type: DateTimePickerType.dateTimeSeparate,
            dateMask: 'yyyy/MM/dd',
            initialValue: DateTime.now().add(new Duration(days: -7)).toString(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            icon: Icon(Icons.event),
            dateLabelText: 'Date From',
            timeLabelText: "Time From",
            onChanged: (val) {
              print(dateFrom);
              dateFrom = DateTime.parse(val);
              print(dateFrom);
            },
            onSaved: (val) => print(val),
          ),
          DateTimePicker(
            type: DateTimePickerType.dateTimeSeparate,
            dateMask: 'yyyy/MM/dd',
            initialValue: DateTime.now().toString(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            icon: Icon(Icons.event),
            dateLabelText: 'Date To',
            timeLabelText: "Time To",
            onChanged: (val) {
              print(dateFrom);
              dateTo = DateTime.parse(val);
              print(dateFrom);
            },
            validator: (val) {
              print(val);
              return null;
            },
            onSaved: (val) => print(val),
          ),
          SizedBox(height: 20,),
          Divider(),
          GestureDetector(
            child: Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.list_alt_rounded,
                          size: 60,
                          color: Colors.green[700],
                        ),
                        Divider(),
                        Text("Sales Summary"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, "/salessummary", arguments: {"permissions": permissionsMap, "dateFrom": dateFrom, "dateTo": dateTo}),
          ),
          GestureDetector(
            child: Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.list_alt_rounded,
                          size: 60,
                          color: Colors.green[700],
                        ),
                        Divider(),
                        Text("Sales Summary User"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, "/salessummaryuser", arguments: permissionsMap),
          ),
          GestureDetector(
            child: Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.list_alt_rounded,
                          size: 60,
                          color: Colors.green[700],
                        ),
                        Divider(),
                        Text("Deposit information"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, "/depositinfo", arguments: permissionsMap),
          ),
        ],
      ),
    );
  }
}
