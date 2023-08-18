import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../../01-search/screens/screens.dart';

class InitialService extends ChangeNotifier {
  //Data actual en el carusel
  int _currentIndexCarousel = 0;
  //Controlador del carusel
  CarouselController? _carouselController;

  int get currentIndexCarousel {
    return _currentIndexCarousel;
  }

  set currentIndexCarousel(int value) {
    _currentIndexCarousel = value;
    notifyListeners();
  }

  //Evento boton "saltar"
  void skiptButton(BuildContext context) {
    changePage(context);
  }

  //Evento boton "siguiente"
  void carouselNext(BuildContext context) async {
    try {
      if (currentIndexCarousel > 0) {
        changePage(context);
      } else {
        print(carouselController);
        await carouselController.nextPage();
      }
    } catch (e) {
      print(e);
    }
  }

  //Evento cambio de pagina
  void changePage(BuildContext context) {
    try {
      Navigator.pushNamed(context, SearchScreen.route);
    } catch (e) {
      print(e);
    }
  }

  //Retorna el carusel controller
  CarouselController get carouselController => _carouselController!;

  //Almacena el carusel controller
  set carouselController(CarouselController controller) {
    _carouselController = controller;
  }
}
