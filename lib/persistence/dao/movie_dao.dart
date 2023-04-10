

import 'package:hive/hive.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/persistence/hive_constants.dart';

class MovieDao {

  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao() {
    return _singleton;
  }

  MovieDao._internal() {

  }

  /// Reactive Programming

  Stream<void> getAllMoviesEventStream() {
    return getMovieBox().watch();
  }

  Stream<List<MovieVO>> getNowPlayingMoviesStream() {
    return Stream.value(
        getAllMovies()
            .where((movie) => movie.isNowPlaying??false)
            .toList()
    );
  }

  Stream<List<MovieVO>> getTopRatedMoviesStream() {
    return Stream.value(
        getAllMovies()
            .where((movie) => movie.isTopRated??false)
            .toList()
    );
  }

  Stream<List<MovieVO>> getPopularMoviesStream() {
    return Stream.value(
        getAllMovies()
            .where((movie) => movie.isPopular??false)
            .toList()
    );
  }

  /// Reactive Programming

  List<MovieVO> getNowPlayingMovies() {
    if(getAllMovies() != null && getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((movie) => movie.isNowPlaying ?? false)
          .toList();
    } else {
      return [];
    }
  }

  List<MovieVO> getTopRatedMovies() {
    if(getAllMovies() != null && getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((movie) => movie.isTopRated ?? false)
          .toList();
    } else {
      return [];
    }
  }

  List<MovieVO> getPopularMovies() {
    if(getAllMovies() != null && getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((movie) => movie.isPopular ?? false)
          .toList();
    } else {
      return [];
    }
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