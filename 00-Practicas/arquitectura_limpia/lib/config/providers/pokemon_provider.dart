import 'package:arquitectura_limpia/domain/use_case/pokemon/pokemon_use_case.dart';
import 'package:flutter/material.dart';

class PokemonProvider extends ChangeNotifier {
  //Tomamos el caso de uso
  final PokemonUseCase pokemonUseCase;

  //Inyectar como parametro, esta inyeccion se hace en la capa
  //más externa la de presentacion
  PokemonProvider({required this.pokemonUseCase});
}
