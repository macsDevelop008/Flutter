import '../../models/pokemon/gateway/pokemon_gateway.dart';
import '../../models/pokemon/pokemon.dart';

class PokemonUseCase {
  //El caso de uso va ha depender del Getway
  final PokemonGateway _pokemonGateway;

  //Le inyectamos el proveedor de los metodos requeridos.
  //Esto nos sirve como puente y abstraer de otras capas.
  PokemonUseCase(this._pokemonGateway);

  //Creamos la clase que encontramos en el Gateway, pero OJO
  //aquí NO se arma la logica, solo le decimos lo que debe
  //retornar. El nombre del metodo puede ser diferente, pero
  //el retorno debe salir del Gateway inyectado.
  Future<List<PokeDetail>> getAllPokemons() {
    return _pokemonGateway.getPokemons();
  }
}
