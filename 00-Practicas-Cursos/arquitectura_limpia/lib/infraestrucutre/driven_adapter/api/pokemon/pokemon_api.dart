import 'package:arquitectura_limpia/domain/models/pokemon/gateway/pokemon_gateway.dart';
import 'package:arquitectura_limpia/domain/models/pokemon/pokemon.dart';
import 'package:arquitectura_limpia/infraestrucutre/driven_adapter/api/pokemon/errors/pokemon_api_error.dart';
import 'package:http/http.dart' as http;

//Aqupi creamos la logica y se implementa el respectivo GATEWAY
//en este caso solo tenemos 1 el "PokemonGateway" que nos "firma"
//el metodo que retorna un listado de pokemones
class PokemonApi extends PokemonGateway {
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
