import 'package:flutter/material.dart';
import 'package:flutter_app_food/00-initial/views/views.dart';

class InitialScreen extends StatelessWidget {
  static const String route = 'initial_screen';
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundView(),
          Positioned(bottom: size.height * 0.01, child: CarouselDataView())
        ],
      ),
    );
  }
}

//TODO: background con diseño
//TODO: carrusel con información

