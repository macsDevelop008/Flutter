import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  late double porcentaje = 0.0;
  late double nuevoPorcentaje = 0.0;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      //print('valor controller: ${controller.value}');

      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.pink,
          onPressed: () {
            porcentaje = nuevoPorcentaje;
            nuevoPorcentaje += 10;
            if (nuevoPorcentaje > 100) {
              nuevoPorcentaje = 0;
              porcentaje = 0;
            }
            controller.forward(from: 0.0);
            setState(() {});
          }),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          color: Colors.transparent,
          child: CustomPaint(
            painter: _MiradialProgress(porcentaje),
          ),
        ),
      ),
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
