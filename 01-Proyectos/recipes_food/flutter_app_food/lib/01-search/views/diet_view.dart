import 'package:flutter/material.dart';
import 'package:flutter_app_food/01-search/services/search_service.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../helpers/helpers.dart';
import '../models/models.dart';

class DietView extends StatefulWidget {
  const DietView({super.key});

  @override
  State<DietView> createState() => _DietViewState();
}

class _DietViewState extends State<DietView> {
  late List<DietModel> _diets;
  late List<MultiSelectItem<DietModel>> _items;
  late List<DietModel> _selectedDiets;
  late SearchService _serviceProvider;

  // ------------------------------------------------ //
  @override
  Widget build(BuildContext context) {
    //Provider
    _serviceProvider = Provider.of<SearchService>(context, listen: true);
    //Listadod e items
    _diets = _serviceProvider.listDiets;
    _items = _diets
        .map((diet) => MultiSelectItem<DietModel>(diet, diet.valueEs))
        .toList();
    //Items ya seleccionados
    _selectedDiets = _serviceProvider.selectedDiets;

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
            Container(
                alignment: Alignment.center,
                height: size.height * 0.05,
                width: double.infinity,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _button(size, Icons.delete, Colors.redAccent, () {
                      _serviceProvider.selectedDiets = [];
                    }),
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

  SingleChildScrollView _selectItems(Color color, Size size) {
    return SingleChildScrollView(
      child: MultiSelectDialogField(
        items: _items,
        initialValue: _selectedDiets,
        searchable: true,
        barrierColor: Colors.black.withOpacity(0.3),
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 1.8),
            borderRadius: BorderRadius.circular(size.width * 0.2)),
        title: const Text(
          'Buscar',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
        buttonText: const Text('Seleccione las deseadas',
            style: TextStyle(fontFamily: 'Roboto')),
        onConfirm: (values) {
          //_selectedDiets = values;
          _serviceProvider.selectedDiets = values;
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
