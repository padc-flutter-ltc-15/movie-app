
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:themovieapp/network/dataagents/movie_data_agent.dart';

import '../../data/vos/movie_vo.dart';
import '../api_constants.dart';

class DioMovieDataAgentImpl extends MovieDataAgent {

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    Map<String, String> queryParameters = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE_EN_US,
      PARAM_PAGE: page.toString()
    };

    /*Dio().get("$BASE_URL_DIO$ENDPOINT_NOW_PLAYING", queryParameters: queryParameters)
        .then((response) => {
          debugPrint("Now Playing Movies=============> ${response.toString()}")
        })
        .catchError((error) => {
          debugPrint("Error=============> ${error.toString()}")
        });*/
    return Future(() => null);
  }

}