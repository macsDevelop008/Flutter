import 'package:change_theme_app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambio de tema'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Aquí recupero el tema actual, ya sea light, dark u otro.
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[index].title),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.colorScheme.secondary,
        ),
      ),
      itemCount: pageRoutes.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: appTheme.primaryColorLight,
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({super.key});
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return SafeArea(
      child: Drawer(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.colorScheme.secondary,
                  child: Text(
                    'FH',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              Expanded(child: _ListaOpciones()),
              ListTile(
                leading: Icon(
                  Icons.lightbulb_outline,
                  color: appTheme.currentTheme.colorScheme.secondary,
                ),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  onChanged: (value) {
                    appTheme.darkTheme = value;
                  },
                  activeColor: appTheme.currentTheme.colorScheme.secondary,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: appTheme.currentTheme.colorScheme.secondary,
                ),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  },
                  activeColor: appTheme.currentTheme.colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
