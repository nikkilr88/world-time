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

      Navigator.pop(context, worldTime.getTimeData);
    }

    Map args = ModalRoute.of(context).settings.arguments;
    String currentLocation = args['location'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose location',
          style: TextStyle(color: Colors.black54),
        ),
        iconTheme: IconThemeData(color: Colors.black54),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[300],
          );
        },
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              updateTime(index);
            },
            title: Text(locations[index].location),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${locations[index].flag}'),
            ),
            trailing: currentLocation == locations[index].location
                ? Icon(Icons.check)
                : null,
          );
        },
      ),
    );
  }
}
