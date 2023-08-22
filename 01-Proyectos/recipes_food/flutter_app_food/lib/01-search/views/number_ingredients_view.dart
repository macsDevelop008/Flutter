import 'package:flutter/material.dart';
import 'package:flutter_app_food/01-search/services/search_service.dart';
import 'package:provider/provider.dart';

import '../helpers/helpers.dart';

class NumberIngredientsView extends StatefulWidget {
  const NumberIngredientsView({super.key});

  @override
  State<NumberIngredientsView> createState() => _NumberIngredientsViewState();
}

class _NumberIngredientsViewState extends State<NumberIngredientsView> {
  late TextEditingController _textNumIngredientsController;
  late SearchService _provider;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color color = Theme.of(context).primaryColor;
    _provider = Provider.of<SearchService>(context);
    _textNumIngredientsController = _provider.numIngredientsController;

    return CardBasicHelper(
        height: size.height * 0.27,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _title(size),
              _textField(color),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _button(size, Icons.check, color, () {
                    _provider.hideKeyboard(context);
                  }),
                  SizedBox(
                    width: size.width * 0.055,
                  ),
                  _button(size, Icons.delete, Colors.red, () {
                    _provider.clearNumIngredients();
                  }),
                ],
              )
            ],
          ),
        ));
  }

  Text _title(Size size) {
    return Text(
      'Número de ingredientes',
      style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.052),
    );
  }

  TextField _textField(Color color) {
    return TextField(
      controller: _textNumIngredientsController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Ejemplo: 1-3  (Min-Max)',
          labelStyle:
              const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 176, 176, 176))),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: color))),
      maxLines: 1,
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
}
