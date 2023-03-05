
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:themovieapp/network/api_constants.dart';
import 'package:themovieapp/network/dataagents/movie_data_agent.dart';
import 'package:themovieapp/network/the_movie_api.dart';

import '../../data/vos/movie_vo.dart';

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
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
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
        .map((response) => response.results)
        .first;
  }

}