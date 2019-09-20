import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.location, this.time, this.flag, this.url});

  Future<void> getTime() async {
    Response response =  await get('http://worldtimeapi.org/api/timezone/$url');
    Map jsonData = jsonDecode(response.body);

    String datetime = jsonData['datetime'];
    int offset = int.parse(jsonData['utc_offset'].substring(0, 3));

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: offset));

    this.time = now.toString();
  }
}