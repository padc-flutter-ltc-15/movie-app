

import 'package:hive/hive.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/persistence/hive_constants.dart';

class MovieDao {

  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao() {
    return _singleton;
  }

  MovieDao._internal() {

  }

  void saveMovie(MovieVO movie) async {
    await getMovieBox().put(movie.id, movie);
  }

  void saveAllMovies(List<MovieVO> list) async {
    Map<int, MovieVO> map = Map.fromIterable(list,
        key: (movie) => movie.id,
        value: (movie) => movie
    );

    await getMovieBox().putAll(map);
  }

  MovieVO? getMovieById(int id) {
    return getMovieBox().get(id);
  }

  List<MovieVO> getAllMovies() {
    return getMovieBox().values.toList();
  }

  Box<MovieVO> getMovieBox() {
    return Hive.box<MovieVO>(BOX_NAME_MOVIE_VO);
  }
}