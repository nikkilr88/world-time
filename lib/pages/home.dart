import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map timeData;

  @override
  Widget build(BuildContext context) {

    timeData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location')
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    timeData['location'],
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20),
              Text(
                timeData['time'],
                style: TextStyle(
                  fontSize: 44
                ),
              ),
            ],
          )
      ),
    );
  }
}

