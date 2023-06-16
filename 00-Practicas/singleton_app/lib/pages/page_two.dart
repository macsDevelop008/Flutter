import 'package:flutter/material.dart';
import 'package:singleton_app/models/services/usuario_services.dart';
import 'package:singleton_app/models/usuario.dart';

class PageTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text('Nombre ${snapshot.data!.nombre}')
                : Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                usuarioService.cargarUsuario(new Usuario(
                    nombre: 'Miguel',
                    edad: 25,
                    profesiones: [
                      'Ing de Sistemas',
                      'Desarrollador de videojuegos'
                    ].toList()));
              },
              color: Colors.blue[200],
              child: Text('Establecer Usuario'),
            ),
            MaterialButton(
              onPressed: () {},
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
