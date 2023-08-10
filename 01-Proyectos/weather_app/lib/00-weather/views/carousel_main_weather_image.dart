import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class CarouselMainWeatherImageView extends StatelessWidget {
  CarouselMainWeatherImageView({super.key});
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = Provider.of<WeatherMainProvider>(context);
    var listData = data.carouselData;
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: size.height * 0.28,
      child: (listData != null && listData.isNotEmpty)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //L
                Container(
                  color: Colors.transparent,
                  width: size.width * 0.1,
                  child: Icon(
                    Icons.chevron_left,
                    color: (listData.isNotEmpty && data.currentPage > 0)
                        ? Colors.black
                        : Colors.transparent,
                  ),
                ),
                SizedBox(
                    width: 280,
                    height: 220,
                    child: _carouselSlider(data: listData, logic: data)),
                //R
                Container(
                  color: Colors.transparent,
                  width: size.width * 0.1,
                  child: Icon(
                    Icons.chevron_right,
                    color: (listData.isNotEmpty &&
                            data.currentPage < listData.length - 1)
                        ? Colors.black
                        : Colors.transparent,
                  ),
                ),
              ],
            )
          : const Center(
              child: Text('No se encontró información'),
            ),
    );
  }

  CarouselSlider _carouselSlider(
      {required List<DataWeatherCarouselModel> data,
      required WeatherMainProvider logic}) {
    List<MainWeatherImageDataWidget> resultList = [];
    for (var element in data) {
      resultList.add(MainWeatherImageDataWidget(
        clouds: element.clouds,
        degreesAverage: element.temp,
        mainImageWeather: element.customIcon,
      ));
    }
    return CarouselSlider.builder(
      carouselController: _carouselController,
      itemCount: resultList.length,
      itemBuilder: (BuildContext context, int i, int pageViewIndex) =>
          Container(
        child: resultList[i],
      ),
      options: CarouselOptions(
        initialPage: logic.currentPage,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          //Cambio en la logica
          logic.modifyCurrentPage(index);
        },
        onScrolled: (value) {},
      ),
    );
  }
}
