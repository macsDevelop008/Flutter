import 'package:flutter/material.dart';

class MainWeatherHorizontalDataWidget extends StatelessWidget {
  final String title;
  final String percentage;
  final Color colorPercentage;
  final Widget customIcon;
  const MainWeatherHorizontalDataWidget(
      {super.key,
      required this.title,
      required this.percentage,
      required this.customIcon,
      required this.colorPercentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.transparent,
      width: 58,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          //Title
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            percentage,
            style: TextStyle(
              color: colorPercentage,
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: customIcon,
          )
        ],
      ),
    );
  }
}
