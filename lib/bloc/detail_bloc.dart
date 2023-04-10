
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
    movieModel.getMovieDetailsFromDatabase(id).listen((value) {
      movieDetailStreamController.sink.add(value);

      movieModel.getMovieGenresByIdsFromDatabase(value.genreIds).listen((value) {
        genresStreamController.sink.add(value);
      }).onError((error) {
        debugPrint(error.toString());
      });
    }).onError((error) {
      debugPrint(error.toString());
    });

    movieModel.getMovieDetailsCredits(id).then((value) {
      actorsStreamController.sink.add(value.first.take(10).toList());
      creatorsStreamController.sink.add(value[1].take(10).toList());
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