
import 'package:scoped_model/scoped_model.dart';

import '../../network/responses/get_movie_details_credits_response.dart';
import '../../network/responses/get_movie_details_response.dart';
import '../vos/actor_vo.dart';
import '../vos/genre_vo.dart';
import '../vos/movie_vo.dart';

abstract class MovieModel extends Model {

  /// State
  List<MovieVO> popularMovieList = [];
  List<MovieVO> nowPlayingMovieList = [];
  List<GenreVO> genreList = [];
  List<MovieVO> movieByGenreList = [];
  List<MovieVO> topRatedMovieList = [];
  List<ActorVO> actorList = [];

  List<ActorVO> castsList = [];
  List<ActorVO> crewList = [];
  MovieVO? movieDetail = null;
  List<GenreVO> movieDetailGenreList = [];

  /// Network
  void getNowPlayingMovies(int page);
  void getPopularMovies(int page);
  void getTopRelatedMovies(int page);
  void getMovieGenres();
  void getMoviesByGenre(int genreId);
  void getActors();
  void getMovieDetails(int id);
  void getMovieDetailsCredits(int id);

  /// Database
  void getNowPlayingMoviesFromDatabase();
  void getPopularMoviesFromDatabase();
  void getTopRelatedMoviesFromDatabase();
  void getMovieGenresFromDatabase();
  void getMovieGenresByIdsFromDatabase(List<int> ids);
  void getActorsFromDatabase();
  void getMovieDetailsFromDatabase(int id);
}