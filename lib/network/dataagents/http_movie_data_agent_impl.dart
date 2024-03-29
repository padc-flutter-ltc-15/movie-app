
import 'package:flutter/cupertino.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/network/api_constants.dart';
import 'package:themovieapp/network/dataagents/movie_data_agent.dart';
import 'package:http/http.dart' as http;
import 'package:themovieapp/network/responses/get_movie_details_credits_response.dart';
import 'package:themovieapp/network/responses/get_movie_details_response.dart';

import '../../data/vos/movie_vo.dart';

class HttpMovieDataAgentImpl extends MovieDataAgent {
  
  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    Map<String, String> queryParameters = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE_EN_US,
      PARAM_PAGE: page.toString()
    };

    var nowPlayingUri = Uri.https(BASE_URL_HTTP, ENDPOINT_GET_NOW_PLAYING, queryParameters);

    /*http.get(nowPlayingUri)
        .then((response) => {
          debugPrint("Now Playing Movies=============> ${response.body.toString()}")
        })
        .catchError((error) => {
          debugPrint("Error=============> ${error.toString()}")
        });*/
    return Future(() => null);
  }

  @override
  Future<List<ActorVO>?> getActors(int page) {
    // TODO: implement getActors
    throw UnimplementedError();
  }

  @override
  Future<MovieVO?> getMovieDetails(int id) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<List<GenreVO>?> getMovieGenres(int page) {
    // TODO: implement getMovieGenres
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenre(int page, int genreId) {
    // TODO: implement getMoviesByGenre
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getPopularMovies(int page) {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getTopRelatedMovies(int page) {
    // TODO: implement getTopRelatedMovies
    throw UnimplementedError();
  }

  @override
  Future<GetMovieDetailsCreditsResponse?> getMovieDetailsCredits(int id) {
    // TODO: implement getMovieDetailsCredits
    throw UnimplementedError();
  }
}