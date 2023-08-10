import 'package:animate_do/animate_do.dart';
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
    var size = MediaQuery.of(context).size;
    return FadeInLeft(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        color: Colors.transparent,
        width: double.infinity,
        height: size.width * 0.15,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: size.width * 0.04),
              color: Colors.transparent,
              width: size.width * 0.3,
              child: Text(
                place,
                style: TextStyle(fontSize: size.width * 0.05),
              ),
            ),
            Container(
                color: Colors.transparent,
                width: size.width * 0.12,
                height: size.height * 0.06,
                child: customIcon),
            Container(
                margin: EdgeInsets.only(left: size.width * 0.1),
                alignment: Alignment.center,
                width: size.width * 0.12,
                height: size.height * 0.04,
                color: Colors.transparent,
                child: Text("$dregress°",
                    style: TextStyle(fontSize: size.width * 0.045)))
          ],
        ),
      ),
    );
  }
}
