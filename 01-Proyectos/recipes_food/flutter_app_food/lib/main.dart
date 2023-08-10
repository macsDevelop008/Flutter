import 'package:flutter/material.dart';
import 'package:flutter_app_food/app_routes.dart';
import 'package:flutter_app_food/themes/general_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: GeneralTheme().lightTheme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      //onGenerateRoute: AppRoutes.onGenerateRoute(settings),
    );
  }
}
