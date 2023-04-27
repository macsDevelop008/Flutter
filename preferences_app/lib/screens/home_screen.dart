import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferences.dart';

import '../widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkmode: ${Preferences.isDarkmode}'),
          Divider(),
          Text(
            'Genero: ${Preferences.gender}',
          ),
          Divider(),
          Text(
            'Nombre de usuario: ${Preferences.name}',
          ),
          Divider(),
        ],
      ),
    );
  }
}
