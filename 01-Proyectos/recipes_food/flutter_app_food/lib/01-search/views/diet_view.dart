import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../helpers/helpers.dart';

class DietView extends StatefulWidget {
  const DietView({super.key});

  @override
  State<DietView> createState() => _DietViewState();
}

class _DietViewState extends State<DietView> {
  static List<Animal?> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal!, animal.name))
      .toList();
  List<Animal?> _selectedAnimals = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  // ------------------------------------------------ //

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color color = Theme.of(context).primaryColor;
    return CardBasicHelper(
      height: size.height * 0.3,
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
                width: double.infinity,
                color: Colors.transparent,
                child: _title(size)),
            //Espacio
            SizedBox(
              height: size.height * 0.03,
            ),
            //*Seleccion de items
            Container(
                width: double.infinity,
                height: size.height * 0.18,
                color: Colors.transparent,
                child: _selectItems(color, size)),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _selectItems(Color color, Size size) {
    return SingleChildScrollView(
      child: MultiSelectDialogField(
        items: _items,
        searchable: true,
        barrierColor: Colors.black.withOpacity(0.3),
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 1.8),
            borderRadius: BorderRadius.circular(size.width * 0.2)),
        //TODO: traduccion
        title: Text(
          'Buscar',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
        buttonText: Text('Seleccione las deseadas',
            style: TextStyle(fontFamily: 'Roboto')),
        onConfirm: (values) {
          _selectedAnimals = values;
        },
      ),
    );
  }

  Text _title(Size size) {
    return Text(
      'Dieta',
      style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.052),
    );
  }
}

class Animal {
  final int id;
  final String name;

  Animal({required this.id, required this.name});
}
