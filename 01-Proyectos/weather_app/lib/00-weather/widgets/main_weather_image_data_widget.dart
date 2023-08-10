import 'package:flutter/material.dart';

class MainWeatherImageDataWidget extends StatelessWidget {
  final Widget mainImageWeather;
  final String degreesAverage; //Grados Promedio
  final String clouds; //Nubes

  const MainWeatherImageDataWidget({
    super.key,
    required this.mainImageWeather,
    required this.degreesAverage,
    required this.clouds,
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
                  right: (degreesAverage.length < 4) ? 82 : 60,
                  child: Text(
                    '$degreesAverage°',
                    style: const TextStyle(fontSize: 40),
                  )),
              //Positioned(bottom: 0, child: Text('a')),
            ],
          ),
        ),
        Text(
          'Cobertura Nubes: $clouds %',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
