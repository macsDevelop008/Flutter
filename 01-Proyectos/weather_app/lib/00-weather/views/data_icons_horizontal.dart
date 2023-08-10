import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/00-weather/services/services.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class DataIconsHorizontalView extends StatelessWidget {
  const DataIconsHorizontalView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WeatherMainProvider>(context);
    var size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      color: Colors.transparent,
      width: double.infinity,
      height: size.height * 0.15,
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 222, 236, 255),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: (data.currentDataHours != null &&
                  data.currentDataHours!.listDataWeatherHours.isNotEmpty &&
                  !data.isLoadingData)
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.currentDataHours!.listDataWeatherHours.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _dataDayWidget(
                        data.currentDataHours!.listDataWeatherHours[index]);
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 3,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _dataDayWidget(DataWeatherHourDayModel data) {
    return FadeInDown(
      child: MainWeatherHorizontalDataWidget(
        customIcon: data.customIcon,
        colorPercentage:
            (data.percentage != null && double.parse(data.percentage) > 50.0)
                ? const Color.fromARGB(179, 6, 140, 229)
                : const Color.fromARGB(112, 33, 33, 33),
        percentage: '${data.percentage}%',
        title: data.time,
      ),
    );
  }
}
