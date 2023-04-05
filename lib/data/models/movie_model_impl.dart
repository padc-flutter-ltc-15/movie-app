
import 'package:flutter/cupertino.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:themovieapp/data/models/movie_model.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/network/dataagents/movie_data_agent.dart';
import 'package:themovieapp/network/dataagents/retrofit_movie_data_agent_impl.dart';
import 'package:themovieapp/network/responses/get_movie_details_response.dart';
import 'package:themovieapp/persistence/dao/actor_dao.dart';
import 'package:themovieapp/persistence/dao/genre_dao.dart';
import 'package:themovieapp/persistence/dao/movie_dao.dart';

import '../../network/responses/get_movie_details_credits_response.dart';

class MovieModelImpl extends MovieModel {

  MovieDao movieDao = MovieDao();
  GenreDao genreDao = GenreDao();
  ActorDao actorDao = ActorDao();

  MovieDataAgent _movieDataAgent = RetrofitMovieDataAgentImpl();

  /// static final variable
  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  /// private constructor
  MovieModelImpl._internal() {

  }

  /// factory constructor
  factory MovieModelImpl() {
    return _singleton;
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    return _movieDataAgent.getNowPlayingMovies(page).then((movies) async {
      List<MovieVO> nowPlayingMovieList = movies?.map((movie) {
        movie.isNowPlaying = true;
        movie.isPopular = false;
        movie.isTopRated = false;

        return movie;
      }).toList()??[];

      movieDao.saveAllMovies(nowPlayingMovieList);

      return Future.value(movies);
    });
  }

  @override
  Future<List<ActorVO>?> getActors() {
    return _movieDataAgent.getActors(1);
  }

  @override
  Future<MovieVO?> getMovieDetails(int id) {
    return _movieDataAgent.getMovieDetails(id);
  }

  @override
  Future<GetMovieDetailsCreditsResponse?> getMovieDetailsCredits(int id) {
    return _movieDataAgent.getMovieDetailsCredits(id);
  }

  @override
  Future<List<GenreVO>?> getMovieGenres() {
    return _movieDataAgent.getMovieGenres(1).then((genres) async {
      List<GenreVO> genreList = genres?.map((genre) {
        return genre;
      }).toList()??[];

      genreDao.saveAllGenres(genreList);

      return Future.value(genres);
    });
  }

  @override
  Future<List<GenreVO>> getMovieGenresByIdsFromDatabase(List<int> ids) {
    var genres = genreDao
        .getGenresByIds(ids)
        ?.toList();

    debugPrint("genres: " + genres.toString());

    return Future.value(
        genres
    );
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenre(int genreId) {
    return _movieDataAgent.getMoviesByGenre(1, genreId);
  }

  @override
  Future<List<MovieVO>?> getPopularMovies(int page) {
    return _movieDataAgent.getPopularMovies(page).then((movies) async {
      List<MovieVO> popularMovieList = movies?.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = true;
        movie.isTopRated = false;

        return movie;
      }).toList()??[];

      movieDao.saveAllMovies(popularMovieList);

      return Future.value(movies);
    });
  }

  @override
  Future<List<MovieVO>?> getTopRelatedMovies(int page) {
    return _movieDataAgent.getTopRelatedMovies(page).then((movies) async {
      List<MovieVO> topRelatedMovieList = movies?.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = false;
        movie.isTopRated = true;

        return movie;
      }).toList()??[];

      movieDao.saveAllMovies(topRelatedMovieList);

      return Future.value(movies);
    });
  }

  @override
  Future<List<ActorVO>> getActorsFromDatabase() {
    return Future.value(
        actorDao
            .getAllActors()
            .toList()
    );
  }

  @override
  Future<MovieVO> getMovieDetailsFromDatabase(int id) {
    var movie = movieDao.getMovieById(id);

    debugPrint("movie: " + movie.toString());

    return Future.value(
      movie
    );
  }

  @override
  Future<List<GenreVO>> getMovieGenresFromDatabase() {
    return Future.value(
        genreDao
            .getAllGenres()
            .toList()
    );
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase() {

    getNowPlayingMovies(1);

    return movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getNowPlayingMoviesStream())
        .map((event) => movieDao.getNowPlayingMoviesStream());
  }

  @override
  Stream<List<MovieVO>> getPopularMoviesFromDatabase() {

    getPopularMovies(1);

    return movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getPopularMoviesStream())
        .map((event) => movieDao.getPopularMoviesStream());
  }

  @override
  Stream<List<MovieVO>> getTopRelatedMoviesFromDatabase() {

    getTopRelatedMovies(1);

    return movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getTopRatedMoviesStream())
        .map((event) => movieDao.getTopRatedMoviesStream());
  }
}