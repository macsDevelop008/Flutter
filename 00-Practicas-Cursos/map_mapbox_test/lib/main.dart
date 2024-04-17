import 'package:flutter/material.dart';
import 'package:map_mapbox_test/screens/map_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MapScreen(),
      theme: ThemeData.dark(),
    );
  }
}
