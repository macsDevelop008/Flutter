import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawHeader(),
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Home'),
            onTap: () {
              //Cambiar de pagina cerrando la pagina previa
              Navigator.pushReplacementNamed(context, HomeScreen.routerName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_outline),
            title: const Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              //Cerra el menú o drawer
              //Navigator.pop(context);
              //Cambiar de pagina
              Navigator.pushNamed(context, SettingsScreen.routerName);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawHeader extends StatelessWidget {
  const _DrawHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
    );
  }
}
