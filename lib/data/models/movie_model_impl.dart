
import 'package:flutter/cupertino.dart';
import 'package:themovieapp/data/models/movie_model.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/genre_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/network/dataagents/movie_data_agent.dart';
import 'package:themovieapp/network/dataagents/retrofit_movie_data_agent_impl.dart';
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

  /// Start of Network Call

  @override
  Future<List<MovieVO>> getNowPlayingMovies() {
    return _movieDataAgent.getNowPlayingMovies(1).then((movies) async {
      List<MovieVO> nowPlayingMovieList = movies.map((movie) {
        movie.isNowPlaying = true;
        movie.isPopular = false;
        movie.isTopRated = false;

        return movie;
      }).toList();

      movieDao.saveAllMovies(nowPlayingMovieList);

      return Future.value(movies);
    });
  }

  @override
  Future<List<MovieVO>> getPopularMovies() {
    return _movieDataAgent.getPopularMovies(1).then((movies) async {
      List<MovieVO> popularMovieList = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = true;
        movie.isTopRated = false;

        return movie;
      }).toList();

      movieDao.saveAllMovies(popularMovieList);

      return Future.value(movies);
    });
  }

  @override
  Future<List<MovieVO>> getTopRelatedMovies() {
    return _movieDataAgent.getTopRelatedMovies(1).then((movies) async {
      List<MovieVO> topRelatedMovieList = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = false;
        movie.isTopRated = true;

        return movie;
      }).toList();

      movieDao.saveAllMovies(topRelatedMovieList);

      return Future.value(movies);
    });
  }

  @override
  Future<List<GenreVO>> getMovieGenres() {
    return _movieDataAgent.getMovieGenres(1).then((genres) async {
      List<GenreVO> genreList = genres.map((genre) {
        return genre;
      }).toList();

      genreDao.saveAllGenres(genreList);

      return Future.value(genres);
    });
  }

  @override
  Future<List<MovieVO>> getMoviesByGenre(int genreId) {
    return _movieDataAgent.getMoviesByGenre(1, genreId).then((movies) {
      movieDao.saveAllMovies(movies);

      return Future.value(movies);
    });
  }

  @override
  Future<List<ActorVO>> getActors() {
    return _movieDataAgent.getActors(1).then((actors) {
      actorDao.saveAllActors(actors);

      return Future.value(actors);
    });
  }

  @override
  Future<MovieVO> getMovieDetails(int id) {
    return _movieDataAgent.getMovieDetails(id);
  }

  @override
  Future<GetMovieDetailsCreditsResponse> getMovieDetailsCredits(int id) {
    return _movieDataAgent.getMovieDetailsCredits(id);
  }

  /// End of Network Calls

  /// Start of Database

  @override
  Future<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    return Future.value(
        movieDao
            .getAllMovies()
            .where((movie) => movie.isNowPlaying ?? true)
            .toList()
    );
  }

  @override
  Future<List<MovieVO>> getPopularMoviesFromDatabase() {
    return Future.value(
        movieDao
            .getAllMovies()
            .where((movie) => movie.isPopular ?? true)
            .toList()
    );
  }

  @override
  Future<List<MovieVO>> getTopRelatedMoviesFromDatabase() {
    return Future.value(
        movieDao
            .getAllMovies()
            .where((movie) => movie.isTopRated ?? true)
            .toList()
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
  Future<List<GenreVO>> getMovieGenresByIdsFromDatabase(List<int> ids) {
    var genres = genreDao
        .getGenresByIds(ids)
        ?.toList();

    return Future.value(
        genres
    );
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

    return Future.value(
      movie
    );
  }

  /// End of Database
}