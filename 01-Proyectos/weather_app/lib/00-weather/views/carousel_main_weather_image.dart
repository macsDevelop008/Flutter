import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/00-weather/models/models.dart';

import '../services/services.dart';
import '../ui/ui.dart';
import '../widgets/widgets.dart';

class CarouselMainWeatherImageView extends StatelessWidget {
  CarouselMainWeatherImageView({super.key});

  final List<MainWeatherImageDataWidget> testList = [
    MainWeatherImageDataWidget(
      degreesAverage: 30,
      mainImageWeather: sunCloud(),
      clouds: 90,
    ),
    MainWeatherImageDataWidget(
      degreesAverage: 30,
      mainImageWeather: aloneCloud(),
      clouds: 90,
    ),
    MainWeatherImageDataWidget(
      degreesAverage: 30,
      mainImageWeather: rayCloud(),
      clouds: 90,
    ),
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
          //L
          IconButton(
              onPressed: () async {
                /*var api = await Api.getInstance();
                var r = await api.historyHours(
                    dataModel: BasicPlaceModel('3.765585', '-75.900528'));
                print('ñññ: ${r!.listDataWeatherHours[1].time}');*/

                /*await LocalDatabase.db.database;
                print(LocalDatabase.db
                    .insertPlace(BasicPlaceModel('-5.742296', '-64.288766')));*/
              },
              icon: const Icon(Icons.chevron_left)),
          SizedBox(width: 280, height: 220, child: _carouselSlider()),
          //R
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
