
import '../../network/responses/get_movie_details_response.dart';
import '../vos/actor_vo.dart';
import '../vos/genre_vo.dart';
import '../vos/movie_vo.dart';

abstract class MovieModel {
  Future<List<MovieVO>?> getNowPlayingMovies();
  Future<List<MovieVO>?> getPopularMovies();
  Future<List<MovieVO>?> getTopRelatedMovies();
  Future<List<GenreVO>?> getMovieGenres();
  Future<List<MovieVO>?> getMoviesByGenre(int genreId);
  Future<List<ActorVO>?> getActors();
  Future<GetMovieDetailsResponse?> getMovieDetails(int id);
}