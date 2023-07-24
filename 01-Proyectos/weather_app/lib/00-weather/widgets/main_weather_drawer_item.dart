import 'package:flutter/material.dart';

class MainWeatherDrawerItem extends StatelessWidget {
  final String place;
  final Widget customIcon;
  final String dregress;
  const MainWeatherDrawerItem(
      {super.key,
      required this.place,
      required this.customIcon,
      required this.dregress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.transparent,
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 80),
            child: Text(
              place,
              style: TextStyle(fontSize: 20),
            ),
          ),
          customIcon,
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text("$dregress°", style: TextStyle(fontSize: 20)),
          )
        ],
      ),
    );
  }
}
