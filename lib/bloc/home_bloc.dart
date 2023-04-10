
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:themovieapp/data/models/movie_model_impl.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';

import '../data/models/movie_model.dart';

class HomeBloc extends ChangeNotifier {
  /// States
  List<MovieVO> nowPlayingMovies = [];
  List<MovieVO> popularMovies = [];
  List<MovieVO> showcaseMovies = [];
  List<ActorVO> actors = [];
  List<GenreVO> genres = [];
  List<MovieVO> moviesByGenre = [];

  MovieModel movieModel = MovieModelImpl();

  HomeBloc() {
    movieModel.getNowPlayingMovies();
    movieModel.getNowPlayingMoviesFromDatabase().then((value) {
      nowPlayingMovies = value;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieModel.getPopularMovies();
    movieModel.getPopularMoviesFromDatabase().then((value) {
      popularMovies = value;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieModel.getTopRelatedMovies();
    movieModel.getTopRelatedMoviesFromDatabase().then((value) {
      showcaseMovies = value;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieModel.getMovieGenres();
    movieModel.getMovieGenresFromDatabase().then((value) {
      genres = value;
      notifyListeners();

      movieModel.getMoviesByGenre(value[0].id).then((value) {
        moviesByGenre = value;
        notifyListeners();
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieModel.getActors();
    movieModel.getActorsFromDatabase().then((value) {
      actors = value;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  void getMoviesByGenre(int id) {
    movieModel.getMoviesByGenre(id).then((value) {
      moviesByGenre = value;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}