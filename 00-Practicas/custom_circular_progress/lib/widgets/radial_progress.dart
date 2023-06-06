import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgressWidget extends StatefulWidget {
  final porcentaje;
  const RadialProgressWidget({this.porcentaje});

  @override
  State<RadialProgressWidget> createState() => _RadialProgressWidgetState();
}

class _RadialProgressWidgetState extends State<RadialProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _MiradialProgress(widget.porcentaje),
        ) //Text('${widget.porcentaje}'),
        );
  }
}

class _MiradialProgress extends CustomPainter {
  final porcentaje;

  _MiradialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    //Ciruclo completo
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5,
        size.height * 0.5); //min -> Regresa el valor minimo entre los 2 numeros

    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;
    //(2 * pi = vuelta de 360 *
    //(porcentaje / 100) = % de esa vuelta con valores de 0 a 1 pero el parametro
    //"porcentaje" toma valores de 1 a 100)
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
