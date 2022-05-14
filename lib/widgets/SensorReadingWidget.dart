import 'package:flutter/material.dart';

class SensorReadingWidget extends StatelessWidget {
  String? imagePath;
  String? sensorReadingValue;
  bool? isSensorReadingDetected;
  String? enabledMessage;
  String? enabledIconPath;

  SensorReadingWidget(
    this.imagePath, {
    this.sensorReadingValue,
    this.isSensorReadingDetected,
    this.enabledMessage,
    this.enabledIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          this.imagePath ?? '',
          width: double.infinity,
          fit: BoxFit.fitWidth,
          filterQuality: FilterQuality.high,
        ),
        sensorReadingValue == null
            ? isSensorReadingDetected == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        this.enabledIconPath ?? '',
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        enabledMessage ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                : const SizedBox.shrink()
            : Container(
                padding: EdgeInsets.only(
                    right: imagePath != null
                        ? imagePath!.endsWith('distance.png')
                            ? 0
                            : 40
                        : 0,
                    bottom: 30),
                alignment: Alignment.centerRight,
                child: imagePath!.endsWith('distance.png')
                    ? Center(
                        child: Text(
                          sensorReadingValue ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Text(
                        sensorReadingValue ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              )
      ],
    );
  }
}
