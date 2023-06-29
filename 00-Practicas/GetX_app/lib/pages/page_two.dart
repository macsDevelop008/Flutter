import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_app/controllers/usuario_controller.dart';
import 'package:singleton_app/models/usuario.dart';

class PageTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Buscar y encontrar el controlador especifico
    final usuarioController = Get.find<UsuarioController>();
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
                usuarioController
                    .cargarUsuario(Usuario(nombre: 'Miguel', edad: 35));
              },
              color: Colors.blue[200],
              child: Text('Establecer Usuario'),
            ),
            MaterialButton(
              onPressed: () {
                usuarioController.cambiarEdad(100);
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
