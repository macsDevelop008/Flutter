import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/villanos_info.dart';

import '../providers/heroes_info.dart';

class SuperText extends StatelessWidget {
  const SuperText({super.key});

  @override
  Widget build(BuildContext context) {
    final heroesInfo = Provider.of<HeroesInfo>(context);
    final villanosInfo = Provider.of<VillanosInfo>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(heroesInfo.heroe), Text(villanosInfo.villano)],
    );
  }
}
