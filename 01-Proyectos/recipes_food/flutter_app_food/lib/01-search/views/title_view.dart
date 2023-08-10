import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Text(
      'Opciones de búsqueda',
      textAlign: TextAlign.center,
      style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.07),
    );
  }
}
