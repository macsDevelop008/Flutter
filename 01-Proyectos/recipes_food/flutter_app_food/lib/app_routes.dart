import 'package:flutter/material.dart';

import '00-initial/screens/screens.dart';
import '01-search/screens/screens.dart';
import '02-recipe_result/screens/screens.dart';

class AppRoutes {
  static const initialRoute = RecipeResultScreen.route;

  static Map<String, Widget Function(BuildContext)> routes = {
    InitialScreen.route: (BuildContext context) => const InitialScreen(),
    SearchScreen.route: (BuildContext context) => const SearchScreen(),
    RecipeResultScreen.route: (BuildContext context) =>
        const RecipeResultScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    //TODO: Cambiar por una ventana por defecto si existe un error
    return MaterialPageRoute(builder: (context) => const InitialScreen());
  }
}
