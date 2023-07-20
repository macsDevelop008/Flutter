import 'package:flutter/material.dart';
import 'package:weather_app/00-weather/screens/weather_screen.dart';
import 'package:weather_app/general_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Material App',
      theme: GeneralTheme.theme,
      initialRoute: WeatherScreen.route,
      routes: {
        WeatherScreen.route: (context) => WeatherScreen(),
      },
    );
  }
}
