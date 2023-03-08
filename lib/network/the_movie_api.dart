
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:themovieapp/network/api_constants.dart';
import 'package:themovieapp/network/responses/get_actors_response.dart';
import 'package:themovieapp/network/responses/get_movie_details_credits_response.dart';
import 'package:themovieapp/network/responses/get_movie_details_response.dart';
import 'package:themovieapp/network/responses/get_movie_genres_response.dart';
import 'package:themovieapp/network/responses/get_movies_by_genre_response.dart';
import 'package:themovieapp/network/responses/get_now_playing_movies_response.dart';
import 'package:themovieapp/network/responses/get_popular_movies_response.dart';
import 'package:themovieapp/network/responses/get_top_rated_movies_response.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi {

  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(ENDPOINT_GET_NOW_PLAYING)
  Future<GetNowPlayingMoviesResponse> getNowPlayingMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET(ENDPOINT_GET_POPULAR)
  Future<GetPopularMoviesResponse> getPopularMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET(ENDPOINT_GET_TOP_RELATED)
  Future<GetTopRatedMoviesResponse> getTopRelatedMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET(ENDPOINT_GET_GENRES)
  Future<GetMovieGenresResponse> getMovieGenres(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language
      );

  @GET(ENDPOINT_GET_MOVIES_BY_GENRE)
  Future<GetMoviesByGenreResponse> getMoviesByGenre(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page,
      @Query(PARAM_GENRE_ID) int genreId,
      );

  @GET(ENDPOINT_GET_ACTORS)
  Future<GetActorsResponse> getActors(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET("$ENDPOINT_GET_MOVIE_DETAILS/{id}")
  Future<GetMovieDetailsResponse> getMovieDetails(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Path(PATH_ID) int id
      );

  @GET("$ENDPOINT_GET_MOVIE_DETAILS/{id}/credits")
  Future<GetMovieDetailsCreditsResponse> getMovieDetailsCredits(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Path(PATH_ID) int id
      );
}