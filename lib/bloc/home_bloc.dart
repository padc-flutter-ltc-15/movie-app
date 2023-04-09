
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:themovieapp/data/models/movie_model_impl.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';

import '../data/models/movie_model.dart';

class HomeBloc {
  /// Reactive Streams
  StreamController<List<MovieVO>> nowPlayingMoviesStreamController = StreamController();
  StreamController<List<MovieVO>> popularMoviesStreamController = StreamController();
  StreamController<List<MovieVO>> showCaseMoviesStreamController = StreamController();
  StreamController<List<MovieVO>> moviesByGenreIdsStreamController = StreamController();
  StreamController<List<GenreVO>> genresStreamController = StreamController();
  StreamController<List<ActorVO>> actorsStreamController = StreamController();

  MovieModel movieModel = MovieModelImpl();

  HomeBloc() {
    movieModel.getNowPlayingMovies();
    movieModel.getNowPlayingMoviesFromDatabase().then((value) {
      nowPlayingMoviesStreamController.sink.add(value);
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieModel.getPopularMovies();
    movieModel.getPopularMoviesFromDatabase().then((value) {
      popularMoviesStreamController.sink.add(value);
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieModel.getTopRelatedMovies();
    movieModel.getTopRelatedMoviesFromDatabase().then((value) {
      showCaseMoviesStreamController.sink.add(value);
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieModel.getMovieGenres();
    movieModel.getMovieGenresFromDatabase().then((value) {
      genresStreamController.sink.add(value);

      movieModel.getMoviesByGenre(value[0].id).then((value) {
        moviesByGenreIdsStreamController.sink.add(value);
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieModel.getActors();
    movieModel.getActorsFromDatabase().then((value) {
      actorsStreamController.sink.add(value);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  void getMoviesByGenre(int id) {
    movieModel.getMoviesByGenre(id).then((value) {
      moviesByGenreIdsStreamController.sink.add(value);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  void dispose() {
    nowPlayingMoviesStreamController.close();
    popularMoviesStreamController.close();
    showCaseMoviesStreamController.close();
    moviesByGenreIdsStreamController.close();
    genresStreamController.close();
    actorsStreamController.close();
  }
}