import 'package:flutter/material.dart';
import 'package:time_zone/pages/home.dart';
import 'package:time_zone/pages/select_location.dart';
import 'package:time_zone/pages/splash_screen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => const SplashScreen(),
    '/home': (context) => const Home(),
    '/location': (context) => const SelectLocation(),
  },
));
