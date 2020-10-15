import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flagUrl: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flagUrl: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flagUrl: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flagUrl: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flagUrl: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flagUrl: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flagUrl: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flagUrl: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];

    await worldTime.getTime();

    Navigator.pop(context, {
      "location": worldTime.location,
      "flag": worldTime.flagUrl,
      "time": worldTime.time,
      "isDayTime": worldTime.isDayTime
    });
  }

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
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  //print(locations[index].location);
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/${locations[index].flagUrl}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
