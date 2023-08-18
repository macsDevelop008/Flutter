import 'package:flutter/material.dart';
import 'package:flutter_app_food/00-initial/services/initial_service.dart';
import 'package:provider/provider.dart';

class PointsCarouselWidget extends StatelessWidget {
  const PointsCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Color onColor = Theme.of(context).primaryColor;
    Color offColor = const Color.fromARGB(255, 227, 227, 227);
    return Container(
      alignment: Alignment.center,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _Point(
          size: size,
          offColor: offColor,
          myNumOfCarousel: 0,
          onColor: onColor,
        ),
        _Point(
          size: size,
          offColor: offColor,
          myNumOfCarousel: 1,
          onColor: onColor,
        ),
      ]),
    );
  }
}

class _Point extends StatelessWidget {
  const _Point({
    super.key,
    required this.size,
    required this.offColor,
    required this.myNumOfCarousel,
    required this.onColor,
  });

  final int myNumOfCarousel;
  final Size size;
  final Color offColor;
  final Color onColor;

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<InitialService>(context);
    var size = MediaQuery.of(context).size;
    return Container(
      margin:
          EdgeInsets.only(right: size.width * 0.02, left: size.width * 0.02),
      width: size.width * 0.025,
      decoration: BoxDecoration(
        color: (service.currentIndexCarousel == myNumOfCarousel)
            ? onColor
            : offColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
