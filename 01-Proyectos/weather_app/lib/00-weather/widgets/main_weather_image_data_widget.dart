import 'package:flutter/material.dart';

class MainWeatherImageDataWidget extends StatelessWidget {
  final Widget mainImageWeather;
  final int degreesAverage; //Grados Promedio
  final int degreesTo; //Grados de
  final int degreesFrom; //Grados hasta

  const MainWeatherImageDataWidget({
    super.key,
    required this.mainImageWeather,
    required this.degreesAverage,
    required this.degreesTo,
    required this.degreesFrom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.transparent,
          height: 190,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(top: 0, child: mainImageWeather),
              Positioned(
                  top: 135,
                  right: 80,
                  child: Text(
                    '$degreesAverage°',
                    style: const TextStyle(fontSize: 40),
                  )),
              //Positioned(bottom: 0, child: Text('a')),
            ],
          ),
        ),
        Text(
          '$degreesFrom°C ~ $degreesTo°C',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
