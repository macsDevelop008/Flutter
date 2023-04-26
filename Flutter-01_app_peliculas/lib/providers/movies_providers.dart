import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '7ec5bffa6c5cdbf84a293e2bf6b2362c';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;
  Map<int, List<Cast>> movieCast = {};

  MoviesProvider() {
    print('Ñañin inicial provider');
    getOnDisplayMovies();
    getPopuLarMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    var response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('/3/movie/now_playing');
    var nowPlayingRespose = NowPlayingResponse.fromJson(jsonData);
    print(nowPlayingRespose.results[1].title);
    onDisplayMovies = nowPlayingRespose.results;
    notifyListeners(); //Redibujar al haber un cambio en la data
  }

  getPopuLarMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('/3/movie/popular', _popularPage);
    var popularRespose = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularRespose.results];
    notifyListeners(); //Redibujar al haber un cambio en la data
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final credistResponse = CreditResponse.fromJson(jsonData);

    movieCast[movieId] = credistResponse.cast;

    return credistResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});

    final response = await http.get(url);
    final seachResponse = SeachResponse.fromJson(response.body);

    return seachResponse.results;
  }
}
