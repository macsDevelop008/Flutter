import 'package:flutter/material.dart';
import 'package:singleton_app/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario(Usuario? user) {
    _usuario = user;
    notifyListeners();
  }
}
