import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_app/models/usuario.dart';

import '../services/usuario_service.dart';

class PageTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

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
                usuarioService.usuario =
                    Usuario(nombre: 'Miguel', edad: 25, profesiones: []);
              },
              color: Colors.blue[200],
              child: const Text('Establecer Usuario'),
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
