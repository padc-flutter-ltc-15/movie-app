
import 'package:themovieapp/data/models/movie_model.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/network/dataagents/movie_data_agent.dart';
import 'package:themovieapp/network/dataagents/retrofit_movie_data_agent_impl.dart';
import 'package:themovieapp/network/responses/get_movie_details_response.dart';

class MovieModelImpl extends MovieModel {

  MovieDataAgent _movieDataAgent = RetrofitMovieDataAgentImpl();

  /// static final variable
  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  /// private constructor
  MovieModelImpl._internal() {

  }

  /// factory constructor
  factory MovieModelImpl() {
    return _singleton;
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovies() {
    return _movieDataAgent.getNowPlayingMovies(1);
  }

  @override
  Future<List<ActorVO>?> getActors() {
    return _movieDataAgent.getActors(1);
  }

  @override
  Future<GetMovieDetailsResponse?> getMovieDetails(int id) {
    return _movieDataAgent.getMovieDetails(id);
  }

  @override
  Future<List<GenreVO>?> getMovieGenres() {
    return _movieDataAgent.getMovieGenres(1);
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenre(int genreId) {
    return _movieDataAgent.getMoviesByGenre(1, genreId);
  }

  @override
  Future<List<MovieVO>?> getPopularMovies() {
    return _movieDataAgent.getPopularMovies(1);
  }

  @override
  Future<List<MovieVO>?> getTopRelatedMovies() {
    return _movieDataAgent.getTopRelatedMovies(1);
  }
}