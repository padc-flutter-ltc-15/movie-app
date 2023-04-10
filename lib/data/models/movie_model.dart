
import '../../network/responses/get_movie_details_credits_response.dart';
import '../../network/responses/get_movie_details_response.dart';
import '../vos/actor_vo.dart';
import '../vos/genre_vo.dart';
import '../vos/movie_vo.dart';

abstract class MovieModel {
  /// Network
  void getNowPlayingMovies(int page);
  void getPopularMovies(int page);
  void getTopRelatedMovies(int page);
  void getMovieGenres();
  Future<List<MovieVO>> getMoviesByGenre(int genreId);
  void getActors();
  void getMovieDetails(int id);
  Future<List<List<ActorVO>>> getMovieDetailsCredits(int id);

  /// Database
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase();
  Stream<List<MovieVO>> getPopularMoviesFromDatabase();
  Stream<List<MovieVO>> getTopRelatedMoviesFromDatabase();
  Stream<List<GenreVO>> getMovieGenresFromDatabase();
  Stream<List<GenreVO>> getMovieGenresByIdsFromDatabase(List<int> ids);
  Stream<List<ActorVO>> getActorsFromDatabase();
  Stream<MovieVO> getMovieDetailsFromDatabase(int id);
}