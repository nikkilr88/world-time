import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading...';

  void setupWorldTime() async {
    print('fetching time...');
    WorldTime worldTime = WorldTime(location: 'Mexico City', url: 'America/Mexico_City', flag: 'mexico.png');

    await worldTime.getTime();
    setState(() {
      time = worldTime.time;
    });
  }

  @override void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text(time)),
        ],
      ),
    );
  }
}
