
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
  int popularMoviePage = 1;
  List<MovieVO> popularMovies = [];
  int relatedMoviePage = 1;
  List<MovieVO> showcaseMovies = [];
  List<ActorVO> actors = [];
  List<GenreVO> genres = [];
  int genreId = 0;
  int genreMoviePage = 1;
  List<MovieVO> moviesByGenre = [];

  MovieModel movieModel = MovieModelImpl();

  HomeBloc() {
    movieModel.getNowPlayingMovies();
    movieModel.getNowPlayingMoviesFromDatabase().listen((value) {
      nowPlayingMovies = value;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });

    movieModel.getPopularMovies(popularMoviePage);
    movieModel.getPopularMoviesFromDatabase().listen((value) {
      popularMovies = value;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });

    movieModel.getTopRelatedMovies(relatedMoviePage);
    movieModel.getTopRelatedMoviesFromDatabase().listen((value) {
      showcaseMovies = value;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });

    movieModel.getMovieGenres();
    movieModel.getMovieGenresFromDatabase().listen((value) {
      genres = value;
      notifyListeners();

      genreId = value[0].id;
      movieModel.getMoviesByGenre(genreId, genreMoviePage).then((value) {
        moviesByGenre = value;
        notifyListeners();
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }).onError((error) {
      debugPrint(error.toString());
    });

    movieModel.getActors();
    movieModel.getActorsFromDatabase().listen((value) {
      actors = value;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void getMoviesByGenre(int id) {
    genreId = id;
    genreMoviePage = 1;
    moviesByGenre = [];

    movieModel.getMoviesByGenre(genreId, genreMoviePage).then((value) {
      moviesByGenre = value;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  void onPopularMovieListEndReached() {
    this.popularMoviePage += 1;
    movieModel.getPopularMovies(popularMoviePage);
  }

  void onMovieListByGenreEndReached() {
    this.genreMoviePage += 1;

    movieModel.getMoviesByGenre(genreId, genreMoviePage).then((value) {
      moviesByGenre += value;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}