import 'package:app_qr_scanner/pages/home_page.dart';
import 'package:app_qr_scanner/pages/map_page.dart';
import 'package:app_qr_scanner/providers/scan_list_provider.dart';
import 'package:app_qr_scanner/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qr Reader',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage(), 'map': (_) => MapPage()},
        theme: ThemeData(
            primaryColor: Colors.deepPurple, primarySwatch: Colors.deepPurple),
      ),
    );
  }
}
