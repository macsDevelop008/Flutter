import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/widgets.dart';

class DataIconsVerticalVertical extends StatelessWidget {
  const DataIconsVerticalVertical({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return MainWeatherVerticalDataWidget(
                  customIcon: SvgPicture.asset(
                    'assets/image/svg/Icon/Icono_Nube_Sol.svg',
                    width: 43,
                  ),
                  day: 'LUN',
                  fromTo: '26 - 35°C',
                  percentage: '99%',
                  percentageColor: Color.fromARGB(255, 30, 126, 204),
                );
              },
            ),
          )),
    );
  }
}
