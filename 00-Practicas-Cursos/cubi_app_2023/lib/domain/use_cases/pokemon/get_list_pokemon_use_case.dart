import '../../models/pokemon/pokemon_model.dart';

//Se encarga de abstraer las funcionalidades
abstract class GetListPokemonUseCase {
  Future<List<PokeDetail>> getPokemons();
}
