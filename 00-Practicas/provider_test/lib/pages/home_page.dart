import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/heroes_info.dart';
import 'package:provider_test/widgets/super_floating_action.dart';
import 'package:provider_test/widgets/super_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final heroesInfo = Provider.of<HeroesInfo>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: heroesInfo.color,
        title: Text(heroesInfo.heroe),
        centerTitle: true,
      ),
      body: Center(
        child: SuperText(),
      ),
      floatingActionButton: SuperFloatingAction(),
    );
  }
}
