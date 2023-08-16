import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselDataWidget extends StatelessWidget {
  const CarouselDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color onColor = Theme.of(context).primaryColor;

    return CarouselSlider(
      items: [
        _part(_changeLanguage(size, onColor), size),
        _part(_welcome(size), size),
        _part(_myText(size), size),
      ],
      options: CarouselOptions(
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          viewportFraction: 1),
    );
  }

  Widget _part(Widget child, Size size) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      width: size.width * 0.9,
      height: size.height * 0.05,
      child: child,
    );
  }

  //----

  _changeLanguage(Size size, Color onColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TODO: cambiar titulo segun el idioma actual
        Text(
          'Change Language',
          style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.05),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //TODO: calular evento segun idioma actual, evento cambio de idioma
            _buttonLanguage(onColor, size, 'Español', () {}),
            _buttonLanguage(onColor, size, 'English', null),
          ],
        )
      ],
    );
  }

  ElevatedButton _buttonLanguage(
      Color onColor, Size size, String text, Function()? function) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(onColor)),
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.2,
        height: size.height * 0.055,
        child: Text(text,
            style: TextStyle(
              fontSize: size.width * 0.05,
              fontFamily: 'Roboto',
            )),
      ),
    );
  }

  //----

  _welcome(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Flavor Finder',
          style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.05),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        //TODO: cambiar segun el idioma
        Text(
          'Encuentra la comida perfecta para cualquier ocasión con nuestro buscador de recetas. Ingresa ingredientes, tipo de cocina o plato deseado, ¡y comienza tu aventura culinaria!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: size.width * 0.035,
              color: const Color.fromARGB(255, 190, 190, 192)),
        ),
      ],
    );
  }

  //----

  _myText(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          //TODO: cambiar segun el idioma
          'Portafolio',
          style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.05),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        //TODO: cambiar segun el idioma
        Text(
          'App desarrollada por Miguel Cuellar a modo de práctica, los comentarios se agradecen :D (otros créditos en el apartado de opciones).',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: size.width * 0.035,
              color: const Color.fromARGB(255, 190, 190, 192)),
        ),
      ],
    );
  }
}