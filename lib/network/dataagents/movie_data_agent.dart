
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/network/responses/get_movie_details_credits_response.dart';

import '../responses/get_movie_details_response.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>> getNowPlayingMovies(int page);
  Future<List<MovieVO>> getPopularMovies(int page);
  Future<List<MovieVO>> getTopRelatedMovies(int page);
  Future<List<GenreVO>> getMovieGenres(int page);
  Future<List<MovieVO>> getMoviesByGenre(int page, int genreId);
  Future<List<ActorVO>> getActors(int page);
  Future<MovieVO> getMovieDetails(int id);
  Future<List<List<ActorVO>>> getMovieDetailsCredits(int id);
}