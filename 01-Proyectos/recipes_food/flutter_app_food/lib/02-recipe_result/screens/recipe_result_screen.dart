import 'package:flutter/material.dart';
import 'package:flutter_app_food/01-search/models/models.dart';
import 'package:flutter_app_food/01-search/services/search_service.dart';
import 'package:flutter_app_food/02-recipe_result/services/recipe_result_service.dart';
import 'package:flutter_app_food/02-recipe_result/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../01-search/ui/ui.dart';

class RecipeResultScreen extends StatelessWidget {
  static const route = 'recipe_result_screen';
  const RecipeResultScreen({super.key});

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final color = Theme.of(context).primaryColor;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                  color: Colors.transparent,
                  width: double.infinity,
                  height: size.height * 0.776,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: FutureBuilder(
                        future: _dataResult(context, size),
                        builder: (BuildContext context,
                            AsyncSnapshot<Widget> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return _loadingCards(size);
                          } else {
                            return snapshot.data!;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const HeaderCurveUI(scaleY: 6),
          ],
        ),
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
            _button(size, Icons.arrow_back, color, () async {
              var provider =
                  Provider.of<RecipeResultService>(context, listen: false);
              provider.backToSearch(context);
              /*var a = await provider
                  .caculateData(QueryModel(keyWord: 'pollo, perro'));
              print(a);*/
              //llega [] cuando no hay data
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

  List<ResultCardWidget> _example() {
    return [
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
    ];
  }

  Widget _loadingCards(Size size) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.03,
        ),
        const LoadResultCardWidget(),
        const LoadResultCardWidget(),
        const LoadResultCardWidget(),
        const LoadResultCardWidget(),
      ],
    );
  }

  Widget _textWithoutData(Size size, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.not_listed_location_rounded,
            size: size.width * 0.3,
            color: Colors.red,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Text(
            'No se encontró información de tu consulta ☹',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Roboto', fontSize: size.width * 0.07),
          ),
        ],
      ),
    );
  }

  Future<Widget> _dataResult(BuildContext context, Size size) async {
    List<ResultCardWidget> result = [];
    var providerSearch = Provider.of<SearchService>(context, listen: false);
    var providerResult =
        Provider.of<RecipeResultService>(context, listen: false);

    String keyWord = providerSearch.keyword;
    List<String>? diet;
    String? numIngredients;
    List<String>? health;
    String? cuisineType;
    String? dishType;
    String? calories;

    if (providerSearch.numIngredients.isEmpty) {
      numIngredients = null;
    } else {
      numIngredients = providerSearch.numIngredients;
    }

    if (providerSearch.selectedDiets.isEmpty) {
      diet = null;
    } else {
      List<String> dietResult = [];
      for (var i in providerSearch.selectedDiets) {
        dietResult.add(i.valueEn);
      }
    }

    if (providerSearch.selectedHealth.isEmpty) {
      health = null;
    } else {
      List<String> healtResult = [];
      for (var i in providerSearch.selectedHealth) {
        healtResult.add(i.valueEn);
      }
    }

    if (providerSearch.selectedTypeCuisine == 0) {
      cuisineType = null;
    } else {
      cuisineType = providerSearch.selectedTypeCuisine as String;
    }

    if (providerSearch.selectedTypePlate == 0) {
      dishType = null;
    } else {
      dishType = providerSearch.selectedTypePlate as String;
    }

    if (providerSearch.numCalories.isEmpty) {
      calories = null;
    } else {
      calories = providerSearch.numCalories;
    }

    QueryModel queryModel = QueryModel(
        keyWord: keyWord,
        diet: diet,
        numIngredients: numIngredients,
        health: health,
        cuisineType: cuisineType,
        dishType: dishType,
        calories: calories);

    var queryResult = await providerResult.caculateData(queryModel);
    //print(queryResult);
    if (queryResult != null && queryResult.isNotEmpty) {
      for (var element in queryResult) {
        result.add(ResultCardWidget(
            tile: element.name,
            urlRecipe: element.url,
            urlImage: element.image,
            calories: element.calories,
            fuente: element.source));
      }
    }

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.03,
        ),
        if (queryResult != null && queryResult.isNotEmpty) ...[
          ...result
        ] else if (queryResult == null || queryResult.isEmpty) ...[
          // ignore: use_build_context_synchronously
          _textWithoutData(size, context)
        ],
      ],
    );
  }
}
