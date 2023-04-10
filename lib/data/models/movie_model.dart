
import '../../network/responses/get_movie_details_credits_response.dart';
import '../../network/responses/get_movie_details_response.dart';
import '../vos/actor_vo.dart';
import '../vos/genre_vo.dart';
import '../vos/movie_vo.dart';

abstract class MovieModel {
  /// Network
  Future<List<MovieVO>> getNowPlayingMovies();
  Future<List<MovieVO>> getPopularMovies();
  Future<List<MovieVO>> getTopRelatedMovies();
  Future<List<GenreVO>> getMovieGenres();
  Future<List<MovieVO>> getMoviesByGenre(int genreId);
  Future<List<ActorVO>> getActors();
  Future<MovieVO?> getMovieDetails(int id);
  Future<GetMovieDetailsCreditsResponse?> getMovieDetailsCredits(int id);

  /// Database
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase();
  Stream<List<MovieVO>> getPopularMoviesFromDatabase();
  Stream<List<MovieVO>> getTopRelatedMoviesFromDatabase();
  Stream<List<GenreVO>> getMovieGenresFromDatabase();
  Stream<List<GenreVO>> getMovieGenresByIdsFromDatabase(List<int> ids);
  Stream<List<ActorVO>> getActorsFromDatabase();
  Future<MovieVO> getMovieDetailsFromDatabase(int id);
}