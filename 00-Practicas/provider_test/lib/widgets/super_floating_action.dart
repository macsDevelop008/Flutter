import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/heroes_info.dart';
import '../providers/villanos_info.dart';

class SuperFloatingAction extends StatelessWidget {
  const SuperFloatingAction({super.key});

  @override
  Widget build(BuildContext context) {
    final heroesInfo = Provider.of<HeroesInfo>(context);
    final villanosInfo = Provider.of<VillanosInfo>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            heroesInfo.heroe = 'Iron Man';
            villanosInfo.villano = 'Ultron';
          },
          child: Icon(Icons.access_alarm),
          backgroundColor: Colors.blue,
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            heroesInfo.heroe = 'Spide';
            villanosInfo.villano = 'Oto';
          },
          child: Icon(Icons.access_time_filled),
          backgroundColor: Colors.red,
        ),
      ],
    );
  }
}
