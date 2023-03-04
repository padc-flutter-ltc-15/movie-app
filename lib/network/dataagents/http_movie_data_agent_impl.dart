
import 'package:flutter/cupertino.dart';
import 'package:themovieapp/network/api_constants.dart';
import 'package:themovieapp/network/dataagents/movie_data_agent.dart';
import 'package:http/http.dart' as http;

import '../../data/vos/movie_vo.dart';

class HttpMovieDataAgentImpl extends MovieDataAgent {
  
  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    Map<String, String> queryParameters = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE_EN_US,
      PARAM_PAGE: page.toString()
    };

    var nowPlayingUri = Uri.https(BASE_URL_HTTP, ENDPOINT_NOW_PLAYING, queryParameters);

    /*http.get(nowPlayingUri)
        .then((response) => {
          debugPrint("Now Playing Movies=============> ${response.body.toString()}")
        })
        .catchError((error) => {
          debugPrint("Error=============> ${error.toString()}")
        });*/
    return Future(() => null);
  }
}