
import '../../network/responses/get_movie_details_credits_response.dart';
import '../../network/responses/get_movie_details_response.dart';
import '../vos/actor_vo.dart';
import '../vos/genre_vo.dart';
import '../vos/movie_vo.dart';

abstract class MovieModel {
  /// Network
  Future<List<MovieVO>?> getNowPlayingMovies(int page);
  Future<List<MovieVO>?> getPopularMovies(int page);
  Future<List<MovieVO>?> getTopRelatedMovies(int page);
  Future<List<GenreVO>?> getMovieGenres();
  Future<List<MovieVO>?> getMoviesByGenre(int genreId);
  Future<List<ActorVO>?> getActors();
  Future<MovieVO?> getMovieDetails(int id);
  Future<GetMovieDetailsCreditsResponse?> getMovieDetailsCredits(int id);

  /// Database
  Future<List<MovieVO>> getNowPlayingMoviesFromDatabase();
  Future<List<MovieVO>> getPopularMoviesFromDatabase();
  Future<List<MovieVO>> getTopRelatedMoviesFromDatabase();
  Future<List<GenreVO>> getMovieGenresFromDatabase();
  Future<List<GenreVO?>> getMovieGenresByIdsFromDatabase(List<int> ids);
  Future<List<ActorVO>> getActorsFromDatabase();
  Future<MovieVO> getMovieDetailsFromDatabase(int id);
}