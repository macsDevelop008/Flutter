import 'package:change_theme_app/pages/launcher_ancho_page.dart';
import 'package:change_theme_app/pages/launcher_page.dart';
import 'package:change_theme_app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => new ThemeChanger(2),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenZise = MediaQuery.of(context).size;

          //Trabajar en modo horizontal
          if (screenZise.width > 500) {
            return Container(
              child: LauncherAnchoPage(),
            );
            //Trabajar en modo vertical
          } else {
            return Container(
              child: LauncherPage(),
            );
          }
        },
      ),
    );
  }
}
