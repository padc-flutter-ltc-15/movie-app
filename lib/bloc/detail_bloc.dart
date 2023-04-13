
import 'package:flutter/foundation.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';

import '../data/models/movie_model.dart';
import '../data/models/movie_model_impl.dart';
import '../data/vos/genre_vo.dart';
import '../data/vos/movie_vo.dart';

class DetailBloc extends ChangeNotifier {

  /// States
  MovieVO? movieDetail;
  List<GenreVO> genres = [];
  List<ActorVO> actors = [];
  List<ActorVO> creators = [];
  List<MovieVO> relatedMovies = [];

  MovieModel movieModel = MovieModelImpl();

  DetailBloc(int id) {
    movieModel.getMovieDetails(id);
    movieModel.getMovieDetailsFromDatabase(id).then((value) {
      movieDetail = value;
      notifyListeners();

      movieModel.getMovieGenresByIdsFromDatabase(value.genreIds??[]).listen((value) {
        genres = value;
        notifyListeners();
      }).onError((error) {
        debugPrint(error.toString());
      });
      
      fetchRelatedMovies(value.genreIds?.last??0);
    }).catchError((error) {
      debugPrint(error.toString());
    });

    movieModel.getMovieDetailsCredits(id).then((value) {
      actors = value?.cast??[];
      creators = value?.crew??[];
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
  
  void fetchRelatedMovies(int genreId) {
    movieModel.getMoviesByGenre(genreId).then((value) {
      relatedMovies = value;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}