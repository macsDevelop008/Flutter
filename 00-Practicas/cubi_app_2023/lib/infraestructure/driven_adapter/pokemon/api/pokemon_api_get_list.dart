import 'package:cubi_app_2023/domain/models/pokemon/pokemon_model.dart';
import 'package:cubi_app_2023/domain/use_cases/pokemon/get_list_pokemon_use_case.dart';
import 'package:http/http.dart' as http;

import '../errors/poke_api_error.dart';

//Resuelve el caso de uso "GetListPokemonUseCase"
class PokemonApiGetList extends GetListPokemonUseCase {
  @override
  Future<List<PokeDetail>> getPokemons() async {
    //Creamos toda la logica necesaria
    Uri url =
        Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=120&limit=20');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final pokemon = pokemonFromJson(response.body);
      final pokemonDetails = pokemon.pokeDetails;
      return pokemonDetails;
    } else {
      //Se llama la clase que trata el error
      throw PokeApiError();
    }
  }
}
//TODO: aquí se puede sacar en una clase a parte la conexion a la
//db, esta se puede implementar de forma abstracta para cambiarla
//a voluntad de forma facil y respetando SOLID