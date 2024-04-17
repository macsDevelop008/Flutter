import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/pages/home_page.dart';
import 'package:provider_test/providers/heroes_info.dart';
import 'package:provider_test/providers/villanos_info.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HeroesInfo(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: HomePage()),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => HeroesInfo()),
        ChangeNotifierProvider(create: (BuildContext context) => VillanosInfo())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: HomePage()),
    );
  }
}
