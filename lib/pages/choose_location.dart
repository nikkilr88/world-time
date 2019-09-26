import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    void updateTime(index) async {
      WorldTime worldTime = locations[index];
      await worldTime.getTime();

      Navigator.pop(context, {
        'location': worldTime.location,
        'flag': worldTime.flag,
        'time': worldTime.time,
        'isDaytime': worldTime.isDaytime
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            onTap: () {
              updateTime(index);
            },
            title: Text(locations[index].location),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${locations[index].flag}'),
            ),
          ));
        },
      ),
    );
  }
}
