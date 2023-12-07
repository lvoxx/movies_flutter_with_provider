import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:movies_provider/models/movie_model.dart';

final List<MovieModel> initialMovie = List.generate(
    50,
    (index) => MovieModel(
        title: 'Movie $index',
        duration: '${Random().nextInt(100) + 60} minutes'));

class MovieProvider with ChangeNotifier {
  final List<MovieModel> _movies = initialMovie;
  List<MovieModel> get movies => _movies;

  final List<MovieModel> _favList = [];
  List<MovieModel> get fav => _favList;

  void addMovieToFav(MovieModel movie) {
    _favList.add(movie);
    notifyListeners();
  }

  void removeMovieFromFav(MovieModel movie) {
    _favList.remove(movie);
    notifyListeners();
  }
}
