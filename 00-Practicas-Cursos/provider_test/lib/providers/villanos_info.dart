import 'package:flutter/material.dart';

class VillanosInfo with ChangeNotifier {
  String _villano = 'Oto';
  Color _color = Colors.blue;

  String get villano {
    return _villano;
  }

  set villano(String nombre) {
    this._villano = nombre;
    notifyListeners();
  }

  Color get color {
    return _color;
  }
}
