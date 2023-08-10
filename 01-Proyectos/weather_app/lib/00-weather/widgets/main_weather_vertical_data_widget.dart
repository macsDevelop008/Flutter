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
      height: 48,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            color: Colors.transparent,
            height: 30,
            width: 130,
            child: Text(day),
          ),
          Container(
            alignment: Alignment.centerLeft,
            color: Colors.transparent,
            width: 110,
            height: 30,
            child: Text(fromTo),
          ),
          Container(
            alignment: Alignment.centerLeft,
            color: Colors.transparent,
            width: 60,
            height: 40,
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
