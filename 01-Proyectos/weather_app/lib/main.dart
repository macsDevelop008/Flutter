import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/00-weather/screens/add_country_screen.dart';
import 'package:weather_app/00-weather/screens/initial_screen.dart';
import 'package:weather_app/00-weather/screens/weather_screen.dart';
import 'package:weather_app/00-weather/services/services.dart';
import 'package:weather_app/general_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => WeatherMainProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Material App',
        theme: GeneralTheme.theme,
        initialRoute: InitialScreen.route,
        routes: {
          InitialScreen.route: (context) => InitialScreen(),
          WeatherScreen.route: (context) => WeatherScreen(),
          AddCountryScreen.route: (context) => AddCountryScreen()
        },
      ),
    );
  }
}
