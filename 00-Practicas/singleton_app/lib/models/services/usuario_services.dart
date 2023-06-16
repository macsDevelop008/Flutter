import 'dart:async';

import 'package:singleton_app/models/usuario.dart';

class _UsuarioService {
  Usuario? _usuario;
  final StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();

  Usuario? get usuario => _usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;
  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user) {
    _usuario = user;
    _usuarioStreamController.add(user);
  }

  //Cerrar el stream para evitar fuga de datos cuando nadie lo use ya
  dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = new _UsuarioService();
