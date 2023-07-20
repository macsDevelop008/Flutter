import 'package:flutter/material.dart';

class MainWeatherVerticalDataWidget extends StatelessWidget {
  final String day;
  final String fromTo;
  final Widget customIcon;
  final String percentage;
  final Color percentageColor;
  const MainWeatherVerticalDataWidget(
      {super.key,
      required this.day,
      required this.fromTo,
      required this.customIcon,
      required this.percentage,
      required this.percentageColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      color: Colors.transparent,
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 120, left: 20),
            child: Text(day),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Text(fromTo),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: customIcon,
          ),
          Text(
            percentage,
            style: TextStyle(color: percentageColor),
          ),
        ],
      ),
    );
  }
}
