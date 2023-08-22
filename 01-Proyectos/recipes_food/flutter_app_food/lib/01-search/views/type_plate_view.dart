import 'package:flutter/material.dart';
import 'package:flutter_app_food/01-search/services/search_service.dart';
import 'package:provider/provider.dart';

import '../helpers/helpers.dart';

class TypePlateView extends StatefulWidget {
  const TypePlateView({super.key});

  @override
  State<TypePlateView> createState() => _TypePlateViewState();
}

class _TypePlateViewState extends State<TypePlateView> {
  late List<DropdownMenuItem<Object>>? _items;
  late SearchService _searchService;
  late Object? _value;

  @override
  Widget build(BuildContext context) {
    _searchService = Provider.of<SearchService>(context);
    _items = _searchService.listTypePlate;
    _value = _searchService.selectedTypePlate;

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
            _searchService.selectedTypePlate = value;
            /*setState(() {
              _value = value;
            });*/
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
