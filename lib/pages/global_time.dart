import 'package:http/http.dart'; //for importing get() function
import 'dart:convert';      //for importing jsonDecode() function
import 'package:intl/intl.dart';

class GlobalTime{
  //the 'late' keyword is for late binding at runtime for variables that cannot be null
  late String location;   // the location name for the UI
  late String time;       // the time in that location
  late String date;       // the date in that location
  late String flag;       // the flag-image of the location
  late String url;        // the location-url for the api endpoint
  late bool isDaytime;

  //since the above variable cannot be null, using them in a class constructor needs the 'required' keyword
  GlobalTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Uri path = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(path);      //there is problem getting response from the url except on physical device
      Map respData = jsonDecode(response.body);


      String datetime = respData['datetime'];
      String offset = respData['utc_offset'].substring(1, 3);

      //create the datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property using DateFormat.jm() function from the 'intl' package
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      date = DateFormat("dd-MM-yyyy").format(now);
      /*
        // this creates an asynchronous string of data for output after 3 sec

      String name = await Future.delayed(const Duration(seconds: 3), (){
        return 'He is going home';
      });

      */
    }
    catch(e){
      time = 'Error getting time data';
      date = 'Error getting date data';
    }
  }
}