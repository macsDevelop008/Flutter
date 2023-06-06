import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimcionesPage extends StatelessWidget {
  const AnimcionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CuadradoAnimado()),
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController
      controller; //Es la barra de tiempo de animaciones que estamos creando

  late Animation<double>
      rotacion; //Es una de las animaciones, en este caso la rotacion
  late Animation<double> opacidad; //Otra animación, en este caso opacidad
  late Animation<double> opacidadOut;
  late Animation<double> moverDerecha; //Otra animación, en este casi movimiento
  late Animation<double> agrandar;
  @override
  void initState() {
    // TODO: implement initState

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    //Animación de rotación
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.25,
            curve: Curves.easeIn))); //Animación de la opacidad

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeIn)));

    moverDerecha = Tween(begin: 0.0, end: 150.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    agrandar = Tween(begin: 0.0, end: 1.2)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    //Listener para saber el estado de la animacion, estos simepre van dentro del
    //inisState
    controller.addListener(() {
      print('Status: ${controller.status}');
      //Si el estado de la animacion es "completed"
      if (controller.status == AnimationStatus.completed) {
        //controller.reverse();
      }
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
    //Play o reproducir anim
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(), //Es tomado en la siguiente linea como parametro
      //"child" y es quien será animado
      builder: (BuildContext context, Widget? childP) {
        //print(rotacion
        //.value); //Se puede ver el valor que va tomando a lo largo del tiempo que se puso
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
              angle: rotacion
                  .value, // Aquí se le dice que ejecute la animación de rotación
              child: Opacity(
                //Aquí se le dice que ejecute la animación de opacidad
                opacity: opacidad.value - opacidadOut.value,
                child: Transform.scale(scale: agrandar.value, child: childP),
              )),
        );
      },
    );
  }
}
