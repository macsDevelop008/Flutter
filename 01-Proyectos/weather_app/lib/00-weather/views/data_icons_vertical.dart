import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../widgets/widgets.dart';

class DataIconsVerticalVertical extends StatelessWidget {
  const DataIconsVerticalVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WeatherMainProvider>(context)
        .currentDataDays
        ?.listDataHistoryDays;
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.43,
      color: Colors.transparent,
      child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 222, 236, 255),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
            child: (data != null &&
                    !Provider.of<WeatherMainProvider>(context).isLoadingData)
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FadeInLeft(
                        child: MainWeatherVerticalDataWidget(
                          customIcon: data[index].customIcon,
                          day: data[index].day,
                          fromTo: '${data[index].from} - ${data[index].to}°C',
                          percentage: '${data[index].clouds}%',
                          percentageColor:
                              (double.parse(data[index].clouds) > 50)
                                  ? const Color.fromARGB(255, 30, 126, 204)
                                  : const Color.fromARGB(255, 0, 0, 0),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 3,
                    ),
                  ),
          )),
    );
  }
}
