import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../ui/ui.dart';
import '../widgets/widgets.dart';

class DataIconsHorizontalView extends StatelessWidget {
  const DataIconsHorizontalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.transparent,
      width: double.infinity,
      height: 118,
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 222, 236, 255),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return MainWeatherHorizontalDataWidget(
                customIcon: SvgPicture.asset(
                  'assets/image/svg/Icon/Icono_Nube_Lluvia.svg',
                  width: 43,
                ),
                colorPercentage: Color.fromARGB(149, 33, 33, 33),
                percentage: '99%',
                title: 'Ahora',
              );
            },
          ),
        ),
      ),
    );
  }
}
