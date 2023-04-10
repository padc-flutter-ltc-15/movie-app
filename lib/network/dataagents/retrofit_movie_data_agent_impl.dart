
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/network/api_constants.dart';
import 'package:themovieapp/network/dataagents/movie_data_agent.dart';
import 'package:themovieapp/network/responses/get_movie_details_response.dart';
import 'package:themovieapp/network/the_movie_api.dart';

import '../../data/vos/movie_vo.dart';
import '../responses/get_movie_details_credits_response.dart';

class RetrofitMovieDataAgentImpl extends MovieDataAgent {

  late TheMovieApi movieApi;

  /// static final variable
  static final RetrofitMovieDataAgentImpl _singleton = RetrofitMovieDataAgentImpl._internal();

  /// factory constructor
  factory RetrofitMovieDataAgentImpl() {
    return _singleton;
  }

  /// private constructor
  RetrofitMovieDataAgentImpl._internal() {
    final dio = Dio();
    movieApi = TheMovieApi(dio);
  }

  /*RetrofitMovieDataAgentImpl() {
    final dio = Dio();
    movieApi = TheMovieApi(dio);
  }*/

  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    /*movieApi.getNowPlayingMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .then((response) => {
          response.results?.forEach((movie) {
            debugPrint("Movie=============> ${movie.toString()}");
          })
        })
        .catchError((error) => {
          debugPrint("Error=============> ${error.toString()}")
        });*/

    return movieApi.getNowPlayingMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results??[])
        .first;
  }

  @override
  Future<List<ActorVO>> getActors(int page) {
    return movieApi.getActors(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results??[])
        .first;
  }

  @override
  Future<MovieVO> getMovieDetails(int id) {
    return movieApi.getMovieDetails(API_KEY, LANGUAGE_EN_US, id)
        .asStream()
        .map((response) => response.toMovieVO())
        .first;
  }

  @override
  Future<List<GenreVO>> getMovieGenres(int page) {
    return movieApi.getMovieGenres(API_KEY, LANGUAGE_EN_US)
        .asStream()
        .map((response) => response.genres??[])
        .first;
  }

  @override
  Future<List<MovieVO>> getMoviesByGenre(int page, int genreId) {
    return movieApi.getMoviesByGenre(API_KEY, LANGUAGE_EN_US, page.toString(), genreId)
        .asStream()
        .map((response) => response.results??[])
        .first;
  }

  @override
  Future<List<MovieVO>> getPopularMovies(int page) {
    return movieApi.getPopularMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results??[])
        .first;
  }

  @override
  Future<List<MovieVO>> getTopRelatedMovies(int page) {
    return movieApi.getTopRelatedMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results??[])
        .first;
  }

  @override
  Future<List<List<ActorVO>>> getMovieDetailsCredits(int id) {
    return movieApi
        .getMovieDetailsCredits(API_KEY, LANGUAGE_EN_US, id)
        .asStream()
        .map((response) => [
          response.cast ?? [],
          response.crew ?? []
        ])
        .first;
  }
}