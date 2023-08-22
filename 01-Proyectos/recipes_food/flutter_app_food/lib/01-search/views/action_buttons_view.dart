import 'package:flutter/material.dart';
import 'package:flutter_app_food/01-search/services/search_service.dart';
import 'package:flutter_app_food/helpers/helpers.dart';
import 'package:provider/provider.dart';

class ActionButtonsView extends StatelessWidget {
  const ActionButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var colors = Theme.of(context);
    var provider = Provider.of<SearchService>(context);

    return Column(
      children: [
        _button(colors.primaryColor, size, () {
          //Verificar si ya escricio algo en la palabra clave
          if (provider.keyword != '') {
            //Ventana confirmar cambio de ventana
            //provider.changePageToResults(context);
            succesFullyModalHelper(context, size, 'Desea ver los resultados?',
                () {
              provider.changePageToResults(context);
            });
          } else {
            //No ha escrito nada en la palabra clave
            //Ventana error
            errorModalHelper(context, size, 'Llene el campo obligatorio');
          }
        }, Icons.search_sharp, 'btn1'),
        SizedBox(
          height: size.height * 0.02,
        ),
        _button(Colors.redAccent, size, () {
          //Ventana para confirmar - eliminar todos los valores
          succesFullyModalHelper(
              context, size, 'Desea eliminar todos los valores?', () {
            provider.removeAllValues(context);
          });
        }, Icons.delete, 'btn2'),
      ],
    );
  }

  FloatingActionButton _button(Color color, Size size, Function()? function,
      IconData icon, String heroTag) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: function,
      backgroundColor: color,
      child: Icon(
        icon,
        size: size.width * 0.08,
      ),
    );
  }
}
