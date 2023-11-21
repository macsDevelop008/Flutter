import 'package:cubi_app_2023/config/blocs/pokemon/bloc/pokemon_bloc.dart';
import 'package:cubi_app_2023/config/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PokemonBloc(),
          )
        ],
        child: MaterialApp.router(
          routerConfig: appRouter,
        ));
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pokemonState = context.watch<PokemonBloc>().state;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<PokemonBloc, PokemonState>(
              //buildWhen: (previus, current) => current.edad > 10, //opcional
              builder: (BuildContext context, state) {
                if (state.esLegendario) {
                  return const Text('El pokemon es legendario');
                } else {
                  return const Text('El pokemon no es el Legendario');
                }
              },
            ),
            TextButton(
                onPressed: () {
                  context
                      .read<PokemonBloc>()
                      .add(const ChangeCityEvent("Perpurjidio"));
                },
                child: Text(
                    'Hola mi ciudad actual es: ${pokemonState.ciudadActual}')),
            TextButton(
                onPressed: () {
                  BlocProvider.of<PokemonBloc>(context, listen: false)
                      .add(ChangeAgeEvent(pokemonState.edad + 1));
                },
                child: context.select((PokemonBloc bloc) =>
                    Text('Hola mi edad actual es: ${bloc.state.edad}'))),
            TextButton(
                onPressed: () {
                  context.go('/two');
                },
                child: Text('Two')),
            TextButton(
                onPressed: () {
                  context.pushNamed('three_screen');
                },
                child: Text('Three')),
          ],
        ),
      ),
    );
  }
}
