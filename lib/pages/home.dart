import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/utils/text-styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String backgroundImage;
  Color backgroundColor;
  Map timeData = {};

  void _updateTimeWithNewLocation() async {
    dynamic newTimeData = await Navigator.pushNamed(context, '/location',
        arguments: {'location': timeData['location']});

    setState(() {
      timeData = newTimeData == null ? timeData : newTimeData;
    });
  }

  void _refreshTime() async {
    WorldTime worldTime = WorldTime(
        location: timeData['location'],
        flag: timeData['flag'],
        url: timeData['url']);

    await worldTime.getTime();

    setState(() {
      timeData = worldTime.getTimeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Time data shizz
    timeData = timeData.isNotEmpty
        ? timeData
        : ModalRoute.of(context).settings.arguments;

    // Day & night styling
    backgroundImage = timeData['isDaytime'] ? 'day.jpg' : 'night.jpg';

    backgroundColor =
        timeData['isDaytime'] ? Colors.purpleAccent : Colors.blue[800];

    return Scaffold(
      backgroundColor: backgroundColor,
      // ! AppBar
      appBar: AppBar(
        backgroundColor:
            timeData['isDaytime'] ? Colors.purple : Colors.blue[900],
        title: Text('World Time'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit_location),
            onPressed: _updateTimeWithNewLocation,
          )
        ],
      ),
      // ! Body
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$backgroundImage'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  timeData['location'],
                  style: setTextStyle(
                      20.0, FontWeight.normal, timeData['isDaytime']),
                ),
                IconButton(
                  color: setTextStyle(null, null, timeData['isDaytime']).color,
                  icon: Icon(
                    Icons.refresh,
                    size: 18.0,
                  ),
                  onPressed: _refreshTime,
                )
              ],
            ),
            SizedBox(height: 15),
            Text(
              timeData['time'],
              style: setTextStyle(56.0, FontWeight.bold, timeData['isDaytime']),
            ),
          ],
        ),
      ),
    );
  }
}
