import '../models/Clients/ClientModel.dart';
import '../models/Tasks/ListGroup.dart';
import '../models/Tasks/Task.dart';
import '../models/User/User.dart';

class API{

  static List<ClientModel> GetOverview(){
    var client = new ClientModel(
      name: "Debtsource",
      onHold: 0,
      waitingOnClient: 3,
      pendingRelease: 4,
      needsScheduling: 21.75,
      scheduled: 0,
      allocated: 55,
      remaining: 27.34,
      groups: [
        new ListGroup(
          name: "Debtsource Sprint - Week 12 - 16 April",
          tasks: [
            new Task(
                hours: 0.5,
                description: "#0035998: ALD Conditions Page",
                dates: "16 Apr",
                priority: "low priority",
                statusId: 1,
                completed: false,
                assignedTo: ["TV"],
                status: "Needs Scheduling"
            ),
            new Task(
                hours: 1,
                description: "#0038865: Credit Limit Master List Error",
                dates: "16 Apr",
                priority: "low priority",
                statusId: 1,
                completed: false,
                assignedTo: ["TV"],
                status: "Needs Scheduling"
            ),
            new Task(
                hours: 1,
                description: "#0039319 Insurance Declaration Reports Change",
                dates: "16 Apr",
                priority: "low priority",
                statusId: 1,
                completed: false,
                assignedTo: ["TV"],
                status: "Needs Scheduling"
            ),
            new Task(
                hours: 0.5,
                description: "[Ticket #0039367] Hollard Master Listing Report Error",
                dates: "16 Apr",
                priority: "low priority",
                statusId: 1,
                completed: false,
                assignedTo: ["TV"],
                status: "Needs Scheduling"
            ),
          ],
        ),
        new ListGroup(
            name: "Old/New System Sync",
            tasks: [
              new Task(
                  hours: 0.25,
                  description: "Client Insurance Report [Sept 20] (combined TU Credit Report)",
                  dates: "24 Mar - 15 Apr",
                  priority: "low priority",
                  statusId: 1,
                  completed: false,
                  assignedTo: ["TV", "MV"],
                  status: "Quote"
              ),
              new Task(
                  hours: 0.25,
                  description: "OctagonReports [Nov 20]",
                  dates: "24 Mar - 15 Apr",
                  priority: "medium priority",
                  statusId: 2,
                  completed: false,
                  assignedTo: ["TV", "MV"],
                  status: "Needs Scheduling"
              ),
              new Task(
                  hours: 0.25,
                  description: "OctagonReports [Nov 20]",
                  dates: "24 Mar - 15 Apr",
                  priority: "medium priority",
                  statusId: 2,
                  completed: true,
                  assignedTo: ["TV", "MV"],
                  status: "Needs Scheduling"
              ),
            ]
        ),
      ],
    );
    return [client];
  }

  static User GetUser(){
    var user = new User(
      name: "Tristan v.d. Merwe",
      profileUrl: "https://projects-api.ncms.co.za/files/UserAvatar?userId=01e0a0b3-77d5-4875-8761-4751a7aa17d9",
      isUser: true,
      lastWeek: 32.75,
      lastDay: 6.25,
    );

    return user;
  }
}