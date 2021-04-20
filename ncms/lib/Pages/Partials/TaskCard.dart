import 'package:flutter/material.dart';
import 'package:ncms/models/Tasks/Task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      elevation: 2.0,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: null,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: double.infinity,
          height: 60,
          child: new Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(task.description),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
