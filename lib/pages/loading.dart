import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    String url = 'http://worldtimeapi.org/api/timezone/America/Mexico_City';

    Response response =  await get(url);
    Map jsonData = jsonDecode(response.body);

    String timezone = jsonData['timezone'];
    String datetime = jsonData['datetime'];
    int offset = int.parse(jsonData['utc_offset'].substring(0, 3));

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: offset));

    print(timezone);
    print(now);
  }

  @override void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading...'),
    );
  }
}
