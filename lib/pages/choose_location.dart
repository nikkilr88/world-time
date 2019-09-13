import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void get_data() {
    
  }

  @override
  void initState() {
    super.initState();
    print('init state func ran');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose location'),
        centerTitle: true,
      ),
      body: Text('Choose Location'),
    );
  }
}
