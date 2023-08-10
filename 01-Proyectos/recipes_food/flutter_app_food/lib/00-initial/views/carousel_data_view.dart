import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CarouselDataView extends StatelessWidget {
  const CarouselDataView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.red.withOpacity(0.0),
      width: size.width,
      height: size.height * 0.29,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //*Ciruclos carrusel
          Container(
            color: Colors.transparent,
            width: size.width,
            height: size.height * 0.06,
            child: const PointsCarouselWidget(),
          ),
          //*Carrusel
          Container(
            color: Colors.transparent,
            width: size.width,
            height: size.height * 0.15,
            child: const CarouselDataWidget(),
          ),
          //*Botones - acciones
          Container(
            color: Colors.transparent,
            width: size.width,
            height: size.height * 0.07,
            child: const ActionsCarouselWidget(),
          ),
        ],
      ),
    );
  }
}
