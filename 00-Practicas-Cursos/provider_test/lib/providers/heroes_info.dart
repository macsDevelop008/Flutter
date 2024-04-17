import 'package:flutter/material.dart';

class HeroesInfo with ChangeNotifier {
  String _heroe = 'Spide';
  Color _color = Colors.blue;

  String get heroe {
    return _heroe;
  }

  set heroe(String nombre) {
    this._heroe = nombre;
    _color = (_heroe == 'Spide') ? Colors.red : Colors.blue;
    //NOTIFICAR A TODOS LOS WIDGETS QUE ESTEN UTILIZANDO
    //PARAMETRO O ATRIBUTO
    notifyListeners();
  }

  Color get color {
    return _color;
  }
}
