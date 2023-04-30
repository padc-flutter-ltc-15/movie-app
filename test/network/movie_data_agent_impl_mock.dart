
import 'dart:async';

import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/network/dataagents/movie_data_agent.dart';
import 'package:themovieapp/network/responses/get_movie_details_credits_response.dart';

import '../mock_data/mock_data.dart';

class MovieDataAgentImplMock extends MovieDataAgent {
  @override
  Future<List<ActorVO>> getActors(int page) {
    return Future.value(getMockActors());
  }

  @override
  Future<MovieVO> getMovieDetails(int id) {
    return Future.value(getMockMoviesForTest().first);
  }

  @override
  Future<GetMovieDetailsCreditsResponse> getMovieDetailsCredits(int id) {
    return Future.value(getMockMovieDetailsCreditsResponse());
  }

  @override
  Future<List<GenreVO>> getMovieGenres(int page) {
    return Future.value(getMockGenres());
  }

  @override
  Future<List<MovieVO>> getMoviesByGenre(int page, int genreId) {
    return Future.value(getMockMoviesForTest());
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    return Future.value(getMockMoviesForTest().where((element) => element.isNowPlaying == true).toList());
  }

  @override
  Future<List<MovieVO>> getPopularMovies(int page) {
    return Future.value(getMockMoviesForTest().where((element) => element.isPopular == true).toList());
  }

  @override
  Future<List<MovieVO>> getTopRelatedMovies(int page) {
    return Future.value(getMockMoviesForTest().where((element) => element.isTopRated == true).toList());
  }

}