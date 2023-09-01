import 'package:flutter/material.dart';
import 'package:flutter_app_food/00-initial/services/initial_service.dart';
import 'package:flutter_app_food/app_routes.dart';
import 'package:flutter_app_food/themes/general_theme.dart';
import 'package:provider/provider.dart';

import '01-search/services/search_service.dart';
import '02-recipe_result/services/recipe_result_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => InitialService(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SearchService(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => RecipeResultService(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: GeneralTheme().lightTheme,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        //onGenerateRoute: AppRoutes.onGenerateRoute(settings),
      ),
    );
  }
}
