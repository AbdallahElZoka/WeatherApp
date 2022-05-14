import 'package:flutter/material.dart';
import 'package:weather_app/screens/GetWeatherFromSensorScreen.dart';
import 'package:weather_app/screens/MainScreen.dart';

class MyAppilcation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.ROUTE_NAME,
      routes: {
        MainScreen.ROUTE_NAME: (context) {
          return MainScreen();
        },
        GetWeatherFromSensorScreen.ROUTE_NAME: (context) {
          return GetWeatherFromSensorScreen();
        }
      },
    );
  }
}
