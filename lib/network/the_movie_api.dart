
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:themovieapp/network/api_constants.dart';
import 'package:themovieapp/network/responses/get_now_playing_response.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi {

  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(ENDPOINT_NOW_PLAYING)
  Future<GetNowPlayingResponse> getNowPlayingMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
  );
}