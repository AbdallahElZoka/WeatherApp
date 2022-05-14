import 'package:flutter/material.dart';
import 'package:weather_app/screens/GetWeatherFromSensorScreen.dart';

class MainScreen extends StatelessWidget {
  static final String ROUTE_NAME = 'Main Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background_final.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset(
                'assets/images/weather_logo_ 2.png',
                width: 616,
                height: 410,
                fit: BoxFit.cover,
              ),
              Spacer(),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(GetWeatherFromSensorScreen.ROUTE_NAME);

                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 34, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(36)),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff394029)),
                  ),
                ),
              ),
              Spacer()
            ],
          )
        ],
      ),
    );
  }
}
