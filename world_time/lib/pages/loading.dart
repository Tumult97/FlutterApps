import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 100.0,
          ),
      ),
      backgroundColor: Colors.deepPurple,
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Johannesburg', flagUrl: "uk.png", url: "Africa/Johannesburg");
    await instance.getTime();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flagUrl,
      "time": instance.time
    });
  }
}
