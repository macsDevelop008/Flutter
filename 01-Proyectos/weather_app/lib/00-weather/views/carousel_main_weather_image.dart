import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../ui/ui.dart';
import '../widgets/widgets.dart';

class CarouselMainWeatherImageView extends StatelessWidget {
  CarouselMainWeatherImageView({super.key});

  final List<MainWeatherImageDataWidget> testList = [
    MainWeatherImageDataWidget(
      degreesAverage: 30,
      degreesFrom: 13,
      degreesTo: 15,
      mainImageWeather: sunCloud(),
    ),
    MainWeatherImageDataWidget(
      degreesAverage: 20,
      degreesFrom: 10,
      degreesTo: 53,
      mainImageWeather: rayCloud(),
    ),
    MainWeatherImageDataWidget(
      degreesAverage: 30,
      degreesFrom: 21,
      degreesTo: 32,
      mainImageWeather: rainCloud(),
    ),
    MainWeatherImageDataWidget(
      degreesAverage: 10,
      degreesFrom: 23,
      degreesTo: 31,
      mainImageWeather: aloneCloud(),
    )
  ];

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                print(carouselController);
              },
              icon: const Icon(Icons.chevron_left)),
          SizedBox(width: 280, height: 220, child: _carouselSlider()),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right)),
        ],
      ),
    );
  }

  CarouselSlider _carouselSlider() {
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: testList.length,
      itemBuilder: (BuildContext context, int i, int pageViewIndex) =>
          Container(
        child: testList[i],
      ),
      options: CarouselOptions(enableInfiniteScroll: false),
    );
  }
}
