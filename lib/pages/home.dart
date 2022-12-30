import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic> ;
       // Set home screen background image and the Scaffold's background color
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.blue[900];

    return Scaffold(
      backgroundColor: bgColor,    // using the ternary variable 'bgColor' to set the Scaffold's background color
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgImage'),   // using the ternary variable 'bgImage' to set the image
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
           padding: const EdgeInsets.fromLTRB(0, 220.0, 0, 0),
           child: Column(
            children: [
              Center(
                child: TextButton.icon(
                  onPressed: () async {
                    // this wait for the Navigation to finish processing before the program execution will continue
                    dynamic result = await Navigator.pushNamed(context,'/location');

                    if(!mounted) return;

                    // set of data received for the Navigation.pop() method in the selectLocation class
                    setState(() {
                      data = {
                        'location': result['location'],
                        'time': result['time'],
                        'isDaytime': result['isDaytime']
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Colors.black87,
                  ),
                  label: const Text(
                      'Edit Location',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 35.0,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 65.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
       ),
        ),
      ),
    );
  }
}