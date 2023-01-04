import 'package:flutter/material.dart';
import 'package:time_zone/pages/global_time.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {

  List<GlobalTime> locations = [
    GlobalTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    GlobalTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    GlobalTime(location: 'Paris', flag: 'france.png', url: 'Europe/Paris'),
    GlobalTime(location: 'Cairo', flag: 'egypt.jpg', url: 'Africa/Cairo'),
    GlobalTime(location: 'Lagos', flag: 'nigeria.jpg', url: 'Africa/Lagos'),
    GlobalTime(location: 'Chicago', flag: 'usa.jpg', url: 'America/Chicago'),
    GlobalTime(location: 'New York', flag: 'usa.jpg', url: 'America/New_York'),
    GlobalTime(location: 'Hong Kong', flag: 'china.png', url: 'Asia/Hong_Kong'),
    GlobalTime(location: 'Seoul', flag: 'south_korea.jpg', url: 'Asia/Seoul'),
    GlobalTime(location: 'Sydney', flag: 'australia.jpg', url: 'Australia/Sydney'),
  ];

  void updateTime(index) async {
    GlobalTime instance = locations[index];
    await instance.getTime();
    //navigate and "pop" (i.e. go back) to home page
    Navigator.pop(context, {
      'location': instance.location,
      'url': instance.flag,
      'time': instance.time,
      'date': instance.date,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){      // 'itemBuilder' accepts a function (){} which returns a widget
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 1.0),
              child: ListTile(
                title: Text(locations[index].location),
                subtitle: const Text('More...'),
                trailing: const Text('Details'),
                dense: false,     //setting it to "true" makes the items smaller
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
                onTap: (){
                  updateTime(index);
                },
              ),
            );
          }
      ),
    );
  }
}
