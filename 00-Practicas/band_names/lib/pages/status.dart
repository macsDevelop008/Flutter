import 'package:band_names/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  static const route = 'status';
  @override
  Widget build(BuildContext context) {
    final socketProvider = Provider.of<SockectProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Server Status: ${socketProvider.serverStatus}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message_sharp),
          onPressed: () {
            //Aquí se llama al provider socket y por medio del get se llama el
            //emit el cual permite emitir el metodo llamado 'emitir-mensaje'
            //y como parametro se le pasa ese objeto o json de datos
            socketProvider.socket.emit('emitir-mensaje',
                {'nombre': 'fluter', 'mensaje': 'Hola desde fluter'});
          }),
    );
  }
}
