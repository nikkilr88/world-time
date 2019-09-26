import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String backgroundImage;
  Color backgroundColor;
  Map timeData = {};

  TextStyle setTextStyle(
      double fontSize, FontWeight fontWeight, bool isDaytime) {
    return TextStyle(
      color: isDaytime ? Colors.grey[800] : Colors.white,
      fontSize: fontSize,
      fontWeight: fontWeight,
      shadows: [
        Shadow(
          blurRadius: 8.0,
          color: isDaytime ? Colors.grey[500] : Colors.grey[800],
          offset: Offset(0.0, 2.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    timeData = timeData.isNotEmpty
        ? timeData
        : ModalRoute.of(context).settings.arguments;

    backgroundImage = timeData['isDaytime'] ? 'day.jpg' : 'night.jpg';
    backgroundColor =
        timeData['isDaytime'] ? Colors.purpleAccent : Colors.blue[800];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$backgroundImage'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  dynamic newTimeData =
                      await Navigator.pushNamed(context, '/location');

                  setState(() {
                    timeData = newTimeData == null ? {} : newTimeData;
                  });
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location')),
            SizedBox(
              height: 200.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  timeData['location'],
                  style: setTextStyle(
                      20.0, FontWeight.normal, timeData['isDaytime']),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              timeData['time'],
              style: setTextStyle(56.0, FontWeight.bold, timeData['isDaytime']),
            ),
          ],
        ),
      )),
    );
  }
}
