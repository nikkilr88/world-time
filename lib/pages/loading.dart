import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Mexico City',
        url: 'America/Mexico_City',
        flag: 'mexico.png');

    await worldTime.getTime();

    Navigator.pushReplacementNamed(context, '/home',
        arguments: worldTime.getTimeData);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitWanderingCubes(
        color: Colors.blue,
      )),
    );
  }
}
