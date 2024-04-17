import 'package:arquitectura_limpia/domain/models/pokemon/pokemon.dart';

abstract class PokemonGateway {
  Future<List<PokeDetail>> getPokemons();
}
