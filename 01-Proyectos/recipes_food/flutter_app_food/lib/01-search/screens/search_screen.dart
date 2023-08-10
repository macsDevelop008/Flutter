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
                  ],
                ),
              ),
            ]))
          ],
        ),
        //Cabecera
        const HeaderCurveUI(scaleY: 6),
      ],
    );
  }
}
