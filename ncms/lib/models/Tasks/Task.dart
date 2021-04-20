import 'History.dart';
import 'Note.dart';
import 'Upload.dart';

class Task {
  List<String> assignedTo;
  List<Note> notes;
  List<Upload> uploads;
  List<History> history;

  double hours;

  int statusId;
  int taskId;

  String status;
  String dates;
  String description;
  String priority;

  bool completed;


  Task(
      {this.assignedTo,
      this.notes,
      this.uploads,
      this.history,
      this.hours,
      this.statusId,
      this.taskId,
      this.status,
      this.dates,
      this.description,
      this.priority,
      this.completed});

  Task.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
    hours = json['Hours'];
    dates = json['Dates'];
    statusId = json['StatusId'];
    status = json['Status'];
    assignedTo = json['AssignedTo'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Description'] = this.description;
    data['Hours'] = this.hours;
    data['Dates'] = this.dates;
    data['StatusId'] = this.statusId;
    data['Status'] = this.status;
    data['AssignedTo'] = this.assignedTo;
    return data;
  }
}
