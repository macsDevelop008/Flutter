import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/usuario/usuario_cubit.dart';
import 'package:singleton_app/models/usuario.dart';

class PageTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                //Es muy simular al provider, aquí buscaria un Cubit en el context
                //y nos permitirá llamar metodos creados y heredados,
                //en este caso un metodo creado
                usuarioCubit.selecccionarUsuario(Usuario(
                    nombre: 'Miguel',
                    edad: 25,
                    profesiones: [
                      'Ing',
                      'Ing de verdad',
                      'No diseñador xd',
                      'Ni QA :v'
                    ]));
              },
              color: Colors.blue[200],
              child: Text('Establecer Usuario'),
            ),
            MaterialButton(
              onPressed: () {
                usuarioCubit.cambiarEdad(26);
              },
              color: Colors.blue[200],
              child: Text('Cambiar Edad'),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue[200],
              child: Text('Añadir Profesion'),
            ),
          ],
        ),
      ),
    );
  }
}
