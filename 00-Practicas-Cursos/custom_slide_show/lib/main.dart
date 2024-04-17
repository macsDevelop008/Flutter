import 'package:custom_slide_show/labs/slideshow_page.dart';
import 'package:custom_slide_show/pages/slideshowFinal_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SlideshowFinalPage(),
    );
  }
}
