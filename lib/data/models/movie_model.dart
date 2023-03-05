
import '../vos/movie_vo.dart';

abstract class MovieModel {
  Future<List<MovieVO>?> getNowPlayingMovies();
}