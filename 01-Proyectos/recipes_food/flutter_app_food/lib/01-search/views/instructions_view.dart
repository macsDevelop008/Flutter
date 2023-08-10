import 'package:flutter/material.dart';

class InstructionsView extends StatelessWidget {
  const InstructionsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Text(
      'Para encontrar la receta perfecta, puedes aprovechar nuestras opciones de búsqueda personalizada.',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size.width * 0.04,
          color: const Color.fromARGB(255, 161, 161, 174)),
    );
  }
}
