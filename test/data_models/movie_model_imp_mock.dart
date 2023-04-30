
import 'package:themovieapp/data/models/movie_model.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/network/responses/get_movie_details_credits_response.dart';

import '../mock_data/mock_data.dart';

class MovieModelImplMock extends MovieModel {
  @override
  Future<List<ActorVO>> getActors() {
    return Future.value(getMockActors());
  }

  @override
  Stream<List<ActorVO>> getActorsFromDatabase() {
    return Stream.value(getMockActors());
  }

  @override
  Future<MovieVO?> getMovieDetails(int id) {
    return Future.value(getMockMoviesForTest().first);
  }

  @override
  Future<GetMovieDetailsCreditsResponse?> getMovieDetailsCredits(int id) {
    return Future.value(getMockMovieDetailsCreditsResponse());
  }

  @override
  Future<MovieVO> getMovieDetailsFromDatabase(int id) {
    return Future.value(getMockMoviesForTest().first);
  }

  @override
  Future<List<GenreVO>> getMovieGenres() {
    return Future.value(getMockGenres());
  }

  @override
  Stream<List<GenreVO>> getMovieGenresByIdsFromDatabase(List<int> ids) {
    return Stream.value(getMockGenres());
  }

  @override
  Stream<List<GenreVO>> getMovieGenresFromDatabase() {
    return Stream.value(getMockGenres());
  }

  @override
  Future<List<MovieVO>> getMoviesByGenre(int genreId, int page) {
    return Future.value(getMockMoviesForTest());
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovies() {
    return Future.value(getMockMoviesForTest().where((element) => element.isNowPlaying == true).toList());
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    return Stream.value(getMockMoviesForTest().where((element) => element.isNowPlaying == true).toList());
  }

  @override
  Future<List<MovieVO>> getPopularMovies(int page) {
    return Future.value(getMockMoviesForTest().where((element) => element.isPopular == true).toList());
  }

  @override
  Stream<List<MovieVO>> getPopularMoviesFromDatabase() {
    return Stream.value(getMockMoviesForTest().where((element) => element.isPopular == true).toList());
  }

  @override
  Future<List<MovieVO>> getTopRelatedMovies(int page) {
    return Future.value(getMockMoviesForTest().where((element) => element.isTopRated == true).toList());
  }

  @override
  Stream<List<MovieVO>> getTopRelatedMoviesFromDatabase() {
    return Stream.value(getMockMoviesForTest().where((element) => element.isTopRated == true).toList());
  }

}
