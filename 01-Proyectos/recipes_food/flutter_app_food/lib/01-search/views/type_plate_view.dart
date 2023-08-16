import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

class TypePlateView extends StatefulWidget {
  const TypePlateView({super.key});

  @override
  State<TypePlateView> createState() => _TypePlateViewState();
}

class _TypePlateViewState extends State<TypePlateView> {
  final _items = [
    DropdownMenuItem(
      value: 0,
      child: Text(
        "Seleccione una opcion",
        style: TextStyle(color: Colors.black.withOpacity(0.3)),
      ),
    ),
    DropdownMenuItem(
      value: "hola",
      child: Text("hola"),
    ),
    DropdownMenuItem(
      value: "hola2",
      child: Text("hola2"),
    ),
    DropdownMenuItem(
      value: "hola3",
      child: Text("hola3"),
    ),
  ];
  Object? _value = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color color = Theme.of(context).primaryColor;
    return CardBasicHelper(
        height: size.height * 0.2,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Espacio
              SizedBox(
                height: size.height * 0.018,
              ),
              //*Titulo
              //TODO: Implementar traductor
              Container(
                  alignment: Alignment.center,
                  height: size.height * 0.05,
                  color: Colors.transparent,
                  child: _title(size)),
              //Espacio
              SizedBox(
                height: size.height * 0.02,
              ),
              //*Seleccion de items
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: size.height * 0.08,
                  color: Colors.transparent,
                  child: _dropdownButton(color, size)),
            ],
          ),
        ));
  }

  Container _dropdownButton(Color color, Size size) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: color, width: 1.8),
          borderRadius: BorderRadius.circular(size.width * 0.2)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: DropdownButton(
          value: _value,
          items: _items,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          icon: const Icon(Icons.arrow_downward),
          isExpanded: true,
          underline: const SizedBox(),
          //borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
      ),
    );
  }

  Text _title(Size size) {
    return Text(
      'Tipo de Plato',
      style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.052),
    );
  }
}
