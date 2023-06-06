import 'package:flutter/material.dart';
import 'package:page_transition_app/pages/pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.access_alarm),
          onPressed: () {
            //Llamamos al metodo que ejecutará el cambio de pagina
            Navigator.push(context, _crearRuta());
          }),
    );
  }

  Route _crearRuta() {
    //Retorna un widget especializado en el cambio de pagina
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            Pagina2Page(),
        //Duración del cambio de pagina
        transitionDuration: Duration(milliseconds: 300),
        //Construccion del cambio de pagina
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //Animación del cambio de pagina
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          /*return SlideTransition(
            //posicion inicial y final del cambio de pagina, con ejecuccion de la animacion
            position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero)
                .animate(curvedAnimation),
            child: child,
          );*/
          /*return ScaleTransition(
              child: child,
              scale:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));*/
          /*return RotationTransition(
            child: child,
            turns: Tween<double>(begin: 0, end: 1.0).animate(curvedAnimation),
          );*/
          /*return FadeTransition(
            opacity:
                Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: child,
          );*/
          return RotationTransition(
            child: FadeTransition(
              opacity:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
              child: child,
            ),
            turns: Tween<double>(begin: 0, end: 1.0).animate(curvedAnimation),
          );
        });
  }
}
