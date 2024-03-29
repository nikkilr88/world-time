import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime = true;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map jsonData = jsonDecode(response.body);

      String datetime = jsonData['datetime'];
      int offset = int.parse(jsonData['utc_offset'].substring(0, 3));

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: offset));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (error) {
      time = 'Something went wrong while fetching the time.';
    }
  }

  Map get getTimeData => {
        'location': location,
        'flag': flag,
        'time': time,
        'isDaytime': isDaytime,
        'url': url
      };
}
