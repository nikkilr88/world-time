import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map timeData;
  String backgroundImage;
  Color backgroundColor;

  TextStyle setTextStyle(double fontSize, bool isDaytime) {
    return TextStyle(
      color: isDaytime ? Colors.grey[800] : Colors.white,
      fontSize: fontSize,
      shadows: [
        Shadow(
          blurRadius: 8.0,
          color: isDaytime ? Colors.grey[600] : Colors.grey[800],
          offset: Offset(0.0, 2.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    timeData = ModalRoute.of(context).settings.arguments;
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
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
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
                  style: setTextStyle(22.0, timeData['isDaytime']),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              timeData['time'],
              style: setTextStyle(56.0, timeData['isDaytime']),
            ),
          ],
        ),
      )),
    );
  }
}
