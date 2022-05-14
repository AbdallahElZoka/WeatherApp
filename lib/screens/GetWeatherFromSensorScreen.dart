import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/SensorReadingWidget.dart';

class GetWeatherFromSensorScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'GetWeatherFromSensorScreen';

  @override
  State<GetWeatherFromSensorScreen> createState() =>
      _GetWeatherFromSensorScreenState();
}

class _GetWeatherFromSensorScreenState
    extends State<GetWeatherFromSensorScreen> {
  Stream<DocumentSnapshot<Map<String, dynamic>>> weatherStream =
      FirebaseFirestore.instance
          .collection('weather')
          .doc('weather_data')
          .snapshots();

  String? wind;
  String? pressure;
  String? tempFahrenheitDegree;
  String? tempCelsiusDegree;
  String? humidity;
  String? distance;
  bool isRainDrop = false;
  bool isMotionDetected = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: weatherStream,
        builder: (context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text("Something went wrong ! "),
              ),
            );
          }
          tempCelsiusDegree = "${snapshot.data?["temperature"]} C ";
          tempFahrenheitDegree =
              "${snapshot.data?["temperature2"]} F";
          wind = "${snapshot.data?['wind']} m/s";
          pressure = "${snapshot.data?['pressure']} hPa";
          humidity = "${snapshot.data?['humidity']} %";
          isRainDrop = snapshot.data?['isRainDrop'];
          isMotionDetected = snapshot.data?['isMotionDetected'];
          distance = "${snapshot.data?['distance']} m";
          List<Widget> widgetsOfGridView = [
            SensorReadingWidget(
              'assets/images/temp1.png',
              sensorReadingValue: tempCelsiusDegree,
            ),
            SensorReadingWidget(
              'assets/images/temp2.png',
              sensorReadingValue: tempFahrenheitDegree,
            ),
            SensorReadingWidget(
              'assets/images/wind.png',
              sensorReadingValue: wind,
            ),
            SensorReadingWidget(
              'assets/images/pressure.png',
              sensorReadingValue: pressure,
            ),
            SensorReadingWidget(
              'assets/images/humidity.png',
              sensorReadingValue: humidity,
            ),
            SensorReadingWidget(
              'assets/images/rain.png',
              isSensorReadingDetected: isRainDrop,
              enabledMessage: 'Rain Drops \n  Detected',
              enabledIconPath: 'assets/images/rain_drop_icon.png',
            ),
            SensorReadingWidget(
              'assets/images/sec.png',
              isSensorReadingDetected: isMotionDetected,
              enabledMessage: 'Motion Detected !',
              enabledIconPath: 'assets/images/motion_detected.png',
            ),
            SensorReadingWidget(
              'assets/images/distance.png',
              sensorReadingValue: distance,
            ),
          ];
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/background_blur.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                GridView.builder(
                    itemCount: 8,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return widgetsOfGridView[index];
                    }),
              ],
            ),
          );
        });
  }
}
