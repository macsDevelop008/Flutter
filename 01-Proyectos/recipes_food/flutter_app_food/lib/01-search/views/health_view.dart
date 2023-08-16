import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../helpers/helpers.dart';

class HealthView extends StatefulWidget {
  const HealthView({super.key});

  @override
  State<HealthView> createState() => _HealthViewState();
}

class _HealthViewState extends State<HealthView> {
  static List<Animal2?> _animals = [
    Animal2(id: 1, name: "Lion"),
    Animal2(id: 2, name: "Flamingo"),
    Animal2(id: 3, name: "Hippo"),
    Animal2(id: 4, name: "Horse"),
    Animal2(id: 5, name: "Tiger"),
    Animal2(id: 6, name: "Penguin"),
    Animal2(id: 7, name: "Spider"),
    Animal2(id: 19, name: "Blue Jay"),
    Animal2(id: 20, name: "Moose"),
    Animal2(id: 21, name: "Gecko"),
    Animal2(id: 22, name: "Kangaroo"),
    Animal2(id: 23, name: "Shark"),
    Animal2(id: 24, name: "Crocodile"),
    Animal2(id: 25, name: "Owl"),
    Animal2(id: 26, name: "Dragonfly"),
    Animal2(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal2>(animal!, animal.name))
      .toList();
  List<Animal2?> _selectedAnimals = [];
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _button(size, Icons.delete, Colors.redAccent, () {}),
                    SizedBox(
                      width: size.width * 0.185,
                    ),
                    _title(size),
                  ],
                )),
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

  Text _title(Size size) {
    return Text(
      'Salud',
      style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.052),
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

  Container _button(
      Size size, IconData iconData, Color iconColor, Function()? funtction) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 1)
      ]),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: size.width * 0.07,
        child: IconButton(
          onPressed: funtction,
          icon: Icon(
            iconData,
            color: iconColor,
            size: size.width * 0.05,
          ),
        ),
      ),
    );
  }
}

class Animal2 {
  final int id;
  final String name;

  Animal2({required this.id, required this.name});
}
