import 'package:arquitectura_limpia/config/providers/pokemon_provider.dart';
import 'package:arquitectura_limpia/domain/use_case/pokemon/pokemon_use_case.dart';
import 'package:arquitectura_limpia/infraestrucutre/driven_adapter/api/pokemon/pokemon_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/pokemon/home_pokemon_screen.dart';

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              //La clase PokemonUseCase pide por parametro el Getway, pero le
              //pasamos la implementación con la logica resuelta. Si fuera más
              //de un Getway pues serían multiples parametros dependiendo de la
              //necesidad del provider.
              PokemonProvider(pokemonUseCase: PokemonUseCase(PokemonApi())),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: const HomePokemonScreen(),
      ),
    );
  }
}
