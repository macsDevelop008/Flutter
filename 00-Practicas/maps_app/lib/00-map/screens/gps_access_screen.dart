import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/00-map/blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<GpsBloc, GpsState>(
        builder: (BuildContext context, state) {
          Widget result = Text('Error en la validacion de los estados');
          if (state.isGpsEnabled) {
            if (state.isGpsPermissionGranted) {
              result = Text('Permisos finardos ya');
            } else {
              result = const _AccessButton();
            }
          } else {
            result = const _EnableGpsMessage();
          }
          return result;
        },
      )),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Es necesario el GPS'),
        MaterialButton(
          onPressed: () {
            //1.Forma de obtener el Bloc desde el arbol de widgets
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            //2.Otra forma
            //final gpsBloc = context.read<GpsBloc>();

            //llamado del metodo deseado
            gpsBloc.askGpsAccess();
          },
          child: Text(
            'Solicitar Acceso',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
          shape: StadiumBorder(),
          splashColor: Colors.transparent,
          elevation: 0,
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Debe habilitar el GPS',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
    );
  }
}
