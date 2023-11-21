import 'package:arquitectura_limpia/config/providers/pokemon_provider.dart';
import 'package:arquitectura_limpia/domain/models/pokemon/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePokemonScreen extends StatelessWidget {
  const HomePokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokemonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola mundo'),
      ),
      body: FutureBuilder<List<PokeDetail>>(
        //HACIENDO USO DEL PROVIDER el cual tiene el caso de uso y podemos
        //acceder a sus metodos
        future: provider.pokemonUseCase.getAllPokemons(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.lenght,
              itemBuilder: (BuildContext context, int index) {
                PokeDetail pokemon = snapshot.data[index];
                return Text(pokemon.name);
              },
            );
          } else if (snapshot.hasError) {
            return const Text('error');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
