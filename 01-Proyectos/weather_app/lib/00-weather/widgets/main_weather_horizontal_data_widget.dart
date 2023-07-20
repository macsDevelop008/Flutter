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
          SizedBox(
            height: 5,
          ),
          //Title
          Container(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          Container(
            child: Text(
              percentage,
              style: TextStyle(
                color: colorPercentage,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: customIcon,
          )
        ],
      ),
    );
  }
}
