import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/movies_providers.dart';
import 'package:flutter_application_1/search/search_delegate.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    //print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: const Text('Peliculas')),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Carrucel de peliculas
              CardSwiper(
                movies: moviesProvider.onDisplayMovies,
              ),
              //Slider de peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopuLarMovies(),
              ),
            ],
          ),
        ));
  }
}
