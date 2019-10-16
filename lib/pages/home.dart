import 'package:flutter/material.dart';
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
    dynamic newTimeData = await Navigator.pushNamed(context, '/location');

    setState(() {
      timeData = newTimeData == null ? timeData : newTimeData;
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
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$backgroundImage'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              timeData['location'],
              style:
                  setTextStyle(20.0, FontWeight.normal, timeData['isDaytime']),
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
