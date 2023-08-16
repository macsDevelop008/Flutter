import 'package:flutter/material.dart';
import 'package:flutter_app_food/02-recipe_result/widgets/widgets.dart';
import 'package:flutter_app_food/helpers/succesfully_modal_helper.dart';

import '../../01-search/ui/ui.dart';

class RecipeResultScreen extends StatelessWidget {
  static const route = 'recipe_result_screen';
  const RecipeResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * 0.12,
              ),
              //*Titulo
              _titleButton(size, color, context),
              //*Result cards
              Container(
                alignment: Alignment.center,
                width: size.width * 0.8,
                height: size.height * 0.3,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: size.height * 0.27,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.height * 0.03))),
                    ),
                    Container(
                      width: size.width * 0.65,
                      height: size.height * 0.03,
                      color: Colors.green,
                    ),
                  ],
                ),
              )
              /*Container(
                color: Colors.transparent,
                width: double.infinity,
                height: size.height * 0.776,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        ResultCardWidget(
                          calories: '200.99',
                          fuente: 'www.ejemplo.com',
                          tile: 'Bandeja Paisa Colombiana',
                          urlImage: 'https://via.placeholder.com/300x400',
                          urlRecipe: 'https://www.youtube.com/',
                        ),
                        ResultCardWidget(
                          calories: '200.99',
                          fuente: 'www.ejemplo.com',
                          tile: 'Bandeja Paisa Colombiana',
                          urlImage: 'https://via.placeholder.com/300x400',
                          urlRecipe: 'https://www.youtube.com/',
                        ),
                        ResultCardWidget(
                          calories: '200.99',
                          fuente: 'www.ejemplo.com',
                          tile: 'Bandeja Paisa Colombiana',
                          urlImage: 'https://via.placeholder.com/300x400',
                          urlRecipe: 'https://www.youtube.com/',
                        ),
                        ResultCardWidget(
                          calories: '200.99',
                          fuente: 'www.ejemplo.com',
                          tile: 'Bandeja Paisa Colombiana',
                          urlImage: 'https://via.placeholder.com/300x400',
                          urlRecipe: 'https://www.youtube.com/',
                        ),
                      ],
                    ),
                  ),
                ),
              ),*/
            ],
          ),
          const HeaderCurveUI(scaleY: 6),
        ],
      ),
    );
  }

  Container _titleButton(Size size, Color color, BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.transparent,
      width: double.infinity,
      height: size.height * 0.07,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Resultados',
              style: TextStyle(
                  fontFamily: 'Harabara', fontSize: size.width * 0.07),
            ),
            _button(size, Icons.arrow_back, color, () {
              succesFullyModalHelper(context, size);
            }),
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
        radius: size.width * 0.055,
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
