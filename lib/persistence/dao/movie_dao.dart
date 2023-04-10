
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

  Stream<void> getAllMoviesEventStream() {
    return getMovieBox().watch();
  }

  Stream<List<MovieVO>> getNowPlayingMoviesStream() {
    return Stream.value(getAllMovies()
        .where((element) => element.isNowPlaying ?? false)
        .toList());
  }

  Stream<List<MovieVO>> getPopularMoviesStream() {
    return Stream.value(
        getAllMovies().where((element) => element.isPopular??true).toList());
  }

  Stream<List<MovieVO>> getTopRatedMoviesStream() {
    return Stream.value(
        getAllMovies().where((element) => element.isTopRated ?? false).toList());
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

  List<MovieVO> getNowPlayingMovies() {
    if (getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((element) => element.isNowPlaying ?? false)
          .toList();
    } else {
      return [];
    }
  }

  List<MovieVO> getPopularMovies() {
    if (getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((element) => element.isPopular ?? true)
          .toList();
    } else {
      return [];
    }
  }

  List<MovieVO> getTopRatedMovies() {
    if (getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((element) => element.isTopRated ?? false)
          .toList();
    } else {
      return [];
    }
  }

  Box<MovieVO> getMovieBox() {
    return Hive.box<MovieVO>(BOX_NAME_MOVIE_VO);
  }
}