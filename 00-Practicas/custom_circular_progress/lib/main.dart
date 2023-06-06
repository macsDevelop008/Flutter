import 'package:custom_circular_progress/labs/circular_progress_page.dart';
import 'package:custom_circular_progress/pages/graficas_circulares_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: GraficasCircularesPage(),
    );
  }
}
