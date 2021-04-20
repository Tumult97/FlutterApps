import 'package:flutter/material.dart';
import 'package:ncms/Connection/API.dart';
import 'package:ncms/models/User/User.dart';
import 'package:ncms/models/Clients/ClientModel.dart';
import 'package:ncms/models/Tasks/History.dart';
import 'package:ncms/models/Tasks/ListGroup.dart';
import 'package:ncms/models/Tasks/Note.dart';
import 'package:ncms/models/Tasks/Task.dart';
import 'package:ncms/models/Tasks/Upload.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  List<ClientModel> client;
  User user;

  @override
  Widget build(BuildContext context) {
    client = client != null ? client : API.GetOverview();
    user = client != null ? user : API.GetUser();
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: ListView.builder(
        itemCount: client.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(client[index].name),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> BuildTaskList(List<Task> tasks){

  }

  List<Widget> BuildGroupList(List<ListGroup> groups){

  }
}
