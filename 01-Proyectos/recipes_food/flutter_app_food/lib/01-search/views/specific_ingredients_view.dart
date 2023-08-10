import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

class SpecificIngredientsView extends StatefulWidget {
  const SpecificIngredientsView({super.key});

  @override
  State<SpecificIngredientsView> createState() =>
      _SpecificIngredientsViewState();
}

class _SpecificIngredientsViewState extends State<SpecificIngredientsView> {
  final TextEditingController _textKeyWordController = TextEditingController();
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //*Titulo
            //TODO: Implementar traductor
            _title(size),
            //*TextField
            _textField(color),
            //*Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _button(size, Icons.check, color, () {}),
                SizedBox(
                  width: size.width * 0.055,
                ),
                _button(size, Icons.delete, Colors.red, () {}),
              ],
            )
          ],
        ),
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
            size: size.width * 0.07,
          ),
        ),
      ),
    );
  }

  TextField _textField(Color color) {
    return TextField(
      controller: _textKeyWordController,
      decoration: InputDecoration(
          labelText: 'Ejemplo: pollo, res',
          labelStyle:
              const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 176, 176, 176))),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: color))),
      maxLines: 2,
    );
  }

  Text _title(Size size) {
    return Text(
      'Ingrediente - Palabra clave',
      style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.052),
    );
  }
}
