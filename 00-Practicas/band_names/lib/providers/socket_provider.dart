import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart';

//Estado del Socket
enum ServerStatus { Online, Offline, Connectiong }

class SockectProvider with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connectiong;

  get serverStatus => this._serverStatus;

  SockectProvider() {
    this._initiConfig();
  }

  void _initiConfig() {
    Socket socket = io(
        'http://192.168.56.1:3000',
        OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());
    socket.onConnect((_) {
      //Cambiar estado a online cuando se conectar server
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    socket.onDisconnect((_) {
      //Cambiar estado a offline cuando se desconecta del server
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
  }
}
