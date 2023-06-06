import 'package:flutter/material.dart';
import 'package:page_transition_app/pages/pagania1_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Pagina1Page(),
    );
  }
}
