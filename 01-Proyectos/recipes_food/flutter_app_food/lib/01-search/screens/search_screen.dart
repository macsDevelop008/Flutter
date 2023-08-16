import 'package:flutter/material.dart';

import '../ui/ui.dart';
import '../views/views.dart';

class SearchScreen extends StatelessWidget {
  static const route = 'search_screen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: _body(size),
    );
  }

  Stack _body(Size size) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            //*Imagen sliver
            const CustomSliverImageView(),
            //Listado de items para la busqueda
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                //padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                padding: EdgeInsets.only(
                    right: size.width * 0.07,
                    left: size.width * 0.07,
                    bottom: size.width * 0.07),
                //Items de la busqueda
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Espacio
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    //TODO: Implementar traduccion
                    //* Titulo
                    const TitleView(),
                    //_title(size),
                    //Espacio
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    //* Instruccion
                    const InstructionsView(),
                    //Espacio
                    SizedBox(
                      height: size.height * 0.045,
                    ),
                    //*Card palabra(s) clave
                    _requiredText(size),
                    const SpecificIngredientsView(),
                    //Espacio
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    //*Card numero de ingredentes
                    const NumberIngredientsView(),
                    //Espacio
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    //*Dieta
                    const DietView(),
                    //Espacio
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    //Salud
                    const HealthView(),
                    //Espacio
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    //Tipo cocina
                    const TypeCuisineView(),
                    //Espacio
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    const TypePlateView(), //Espacio
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    const NumbewClearingsView()
                  ],
                ),
              ),
            ]))
          ],
        ),
        //Cabecera
        const HeaderCurveUI(scaleY: 6),
        //Botonos flotantes
        Positioned(
            bottom: size.height * 0.02,
            right: size.width * 0.03,
            child: const ActionButtonsView()),
      ],
    );
  }

  Widget _requiredText(Size size) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: size.width * 0.05),
        child: Text(
          'Obligatorio',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }
}
