import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subTitulo;
  final Color color1;
  final Color color2;

  const IconHeader(
      {super.key,
      required this.icon,
      required this.titulo,
      required this.subTitulo,
      this.color1 = const Color(0xff526BF6),
      this.color2 = const Color(0xff67ACF2)});

  @override
  Widget build(BuildContext context) {
    final colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(children: [
      _IconHeaderBackground(
        color1: this.color1,
        color2: this.color2,
      ),
      Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            this.icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          )),
      Column(
        children: [
          SizedBox(
            height: 80,
            width: double.infinity,
          ),
          Text(this.subTitulo,
              style: TextStyle(
                fontSize: 20,
                color: colorBlanco,
              )),
          SizedBox(
            height: 20,
          ),
          Text(this.titulo,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: colorBlanco,
              )),
          SizedBox(
            height: 20,
          ),
          FaIcon(
            this.icon,
            size: 80,
            color: Colors.white,
          )
        ],
      )
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _IconHeaderBackground({
    super.key,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          //color: Colors.red,
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(colors: [
            color1,
            color2,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
