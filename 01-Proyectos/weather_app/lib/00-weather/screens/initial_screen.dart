import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/00-weather/screens/weather_screen.dart';

import '../services/services.dart';

class InitialScreen extends StatelessWidget {
  static const route = 'initial_screen';
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<WeatherMainProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 252),
      body: FutureBuilder(
        future: info.initialData(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return _circleLoad();
          //Tarea en cusro
          /*if (snapshot.connectionState == ConnectionState.waiting) {
            return _circleLoad();
          }
          //Error
          else if (snapshot.hasError) {
            return const Center(
              child: Text('Error en la data'),
            );
          }
          //Finalizada
          else {
            //Cargar de forma automatica el cambio de pagina
            Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.pushNamed(context, WeatherScreen.route);
            });
            return _circleLoad();
          }*/
        },
      ),
    );
  }

  Center _circleLoad() {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 22,
        color: Colors.black,
      ),
    );
  }
}
