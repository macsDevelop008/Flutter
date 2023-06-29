import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_app/controllers/usuario_controller.dart';
import 'package:singleton_app/models/usuario.dart';
import 'package:singleton_app/pages/page_two.dart';

class PageOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Inyectar el controlador
    //Internamente esto crea en el arbol de widgetds o context el controllador
    //para ser usado de este punto para abajo en el arbol de widgets
    final usuarioController = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      //Con el Obx le decimos que cada vez que alguna propiedad o variable del
      //usuarioController cambie, haga su redibujado en base a las condiciones.
      //Para obtener el valor de una propiedad de controler usar .value
      body: Obx(() => usuarioController.existeUsuario.value
          ? InformacionUsuario(
              usuario: usuarioController.usuario.value,
            )
          : NoInformation()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('page2'),
        //Get.to(PageTwoPage()),
        //Navigator.pushNamed(context, 'page2'),
        child: Icon(Icons.access_alarm),
      ),
    );
  }
}

class NoInformation extends StatelessWidget {
  const NoInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('No hay usuario seleccionado'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Profesion 1'),
          ),
          ListTile(
            title: Text('Profesion 2'),
          ),
          ListTile(
            title: Text('Profesion 3'),
          ),
        ],
      ),
    );
  }
}
