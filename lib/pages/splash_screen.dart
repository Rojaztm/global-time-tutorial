import 'package:flutter/material.dart';
import 'package:time_zone/pages/global_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void setGlobalTime() async {
    GlobalTime instance = GlobalTime(location: 'Lagos', flag: 'nigeria.jpg', url: 'Africa/Lagos');
      /* The 'await' keyword tells the compiler to wait for the instance.getTime() function which connects
         to an external api to finish before the rest of the program execution will continue.
            The getTime() function return-type must be declared as Future<> in its source code i.e. the
            GlobalTime class */
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'date': instance.date,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState(){
    super.initState();
    setGlobalTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitCircle(
          duration: Duration(milliseconds: 1200),
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

