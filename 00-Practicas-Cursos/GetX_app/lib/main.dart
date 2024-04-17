import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_app/pages/page_one.dart';
import 'package:singleton_app/pages/page_two.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      /*routes: {
        'page1': (_) => PageOnePage(),
        'page2': (_) => PageTwoPage(),
      },*/
      getPages: [
        GetPage(name: '/page1', page: () => PageOnePage()),
        GetPage(name: '/page2', page: () => PageTwoPage())
      ],
    );
  }
}
