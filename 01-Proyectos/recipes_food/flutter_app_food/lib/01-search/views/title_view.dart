import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FadeInDown(
      child: Text(
        'Opciones de búsqueda',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.07),
      ),
    );
  }
}
