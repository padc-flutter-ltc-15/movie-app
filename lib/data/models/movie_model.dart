
import 'package:scoped_model/scoped_model.dart';

import '../../network/responses/get_movie_details_credits_response.dart';
import '../../network/responses/get_movie_details_response.dart';
import '../vos/actor_vo.dart';
import '../vos/genre_vo.dart';
import '../vos/movie_vo.dart';

abstract class MovieModel extends Model {

  /// State
  List<MovieVO> nowPlayingMovieList = [];
  List<MovieVO> popularMovieList = [];
  List<GenreVO> genreList = [];
  List<MovieVO> movieByGenreList = [];
  List<MovieVO> topRatedMovieList = [];
  List<ActorVO> actorList = [];

  /// Network
  void getNowPlayingMovies(int page);
  void getPopularMovies(int page);
  void getTopRelatedMovies(int page);
  void getMovieGenres();
  void getMoviesByGenre(int genreId);
  void getActors();
  Future<MovieVO?> getMovieDetails(int id);
  Future<GetMovieDetailsCreditsResponse?> getMovieDetailsCredits(int id);

  /// Database
  void getNowPlayingMoviesFromDatabase();
  void getPopularMoviesFromDatabase();
  void getTopRelatedMoviesFromDatabase();
  void getMovieGenresFromDatabase();
  Future<List<GenreVO>> getMovieGenresByIdsFromDatabase(List<int> ids);
  void getActorsFromDatabase();
  Future<MovieVO> getMovieDetailsFromDatabase(int id);
}