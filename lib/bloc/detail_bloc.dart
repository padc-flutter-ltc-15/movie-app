
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';

import '../data/models/movie_model.dart';
import '../data/models/movie_model_impl.dart';
import '../data/vos/genre_vo.dart';
import '../data/vos/movie_vo.dart';

class DetailBloc {

  StreamController<MovieVO> movieDetailStreamController = StreamController();
  StreamController<List<GenreVO>> genresStreamController = StreamController();
  StreamController<List<ActorVO>> actorsStreamController = StreamController();
  StreamController<List<ActorVO>> creatorsStreamController = StreamController();

  MovieModel movieModel = MovieModelImpl();

  DetailBloc(int id) {
    movieModel.getMovieDetails(id);
    movieModel.getMovieDetailsFromDatabase(id).then((value) {
      movieDetailStreamController.sink.add(value);

      movieModel.getMovieGenresByIdsFromDatabase(value.genreIds).then((value) {
        genresStreamController.sink.add(value);
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieModel.getMovieDetailsCredits(id).then((value) {
      actorsStreamController.sink.add(value?.cast??[]);
      creatorsStreamController.sink.add(value?.crew??[]);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  void dispose() {
    movieDetailStreamController.close();
    genresStreamController.close();
    actorsStreamController.close();
    creatorsStreamController.close();
  }
}