import 'package:band_names/pages/home.dart';
import 'package:band_names/pages/status.dart';
import 'package:band_names/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return SockectProvider();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: HomePage.route,
        routes: {
          HomePage.route: (_) => HomePage(),
          StatusPage.route: (_) => StatusPage()
        },
      ),
    );
  }
}
