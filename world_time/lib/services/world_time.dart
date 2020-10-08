import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time;
  String flagUrl;
  String url;

  WorldTime({ this.location, this.flagUrl, this.url });

  Future<void> getTime() async {
    try{
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      var resObj = jsonDecode(response.body);

      String datetime = resObj["datetime"];
      String offset = resObj["utc_offset"].substring(1, 3);
      DateTime date = DateTime.parse(datetime);
      date = date.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(date);
      print(time);
    }
    catch(ex){
      print("caught error: $ex");
      time = "Unable to get time. An unexpected error has occured.";
    }
  }
}