import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart';

//Estado del Socket
enum ServerStatus { Online, Offline, Connectiong }

class SockectProvider with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connectiong;
  //Exponer el socket para cualquier clase que invoque
  late Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  Socket get socket => this.socket;

  SockectProvider() {
    this._initiConfig();
  }

  void _initiConfig() {
    _socket = io(
        'http://192.168.56.1:3000',
        OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());
    _socket.onConnect((_) {
      //Cambiar estado a online cuando se conectar server
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _socket.onDisconnect((_) {
      //Cambiar estado a offline cuando se desconecta del server
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    //Escuchar evento del servidor
    //nuevo-mensaje -> es el nombre del emit por el lado del servidor que
    //está escuchando en estos momentos
    //data -> es lo que llega por parametro, puede ser string, int, json, etc
    /*socket.on('nuevo-mensaje', (data) {
      print('nuevo mensaje: ${data}');
    });*/
  }
}
