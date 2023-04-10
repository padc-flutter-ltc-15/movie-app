
import 'package:flutter/cupertino.dart';
import 'package:stream_transform/stream_transform.dart';
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
  void getNowPlayingMovies(int page) {
    _movieDataAgent.getNowPlayingMovies(page).then((movies) async {
      List<MovieVO> nowPlayingMovies = movies.map((movie) {
        movie.isNowPlaying = true;
        movie.isPopular = false;
        movie.isTopRated = false;
        return movie;
      }).toList();
      movieDao.saveAllMovies(nowPlayingMovies);
    });
  }

  @override
  void getPopularMovies(int page) {
    _movieDataAgent.getPopularMovies(page).then((movies) async {
      List<MovieVO> popularMovies = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = true;
        movie.isTopRated = false;
        return movie;
      }).toList();
      movieDao.saveAllMovies(popularMovies);
    });
  }

  @override
  void getTopRelatedMovies(int page) {
    _movieDataAgent.getTopRelatedMovies(page).then((movies) async {
      List<MovieVO> topRatedMovies = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = false;
        movie.isTopRated = true;
        return movie;
      }).toList();
      movieDao.saveAllMovies(topRatedMovies);
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
  Future<List<List<ActorVO>>> getMovieDetailsCredits(int id) {
    return _movieDataAgent.getMovieDetailsCredits(id);
  }

  /// End of Network Calls

  /// Start of Database

  @override
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    getNowPlayingMovies(1);
    return movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getNowPlayingMoviesStream())
        .map((event) => movieDao.getNowPlayingMovies());
  }

  @override
  Stream<List<MovieVO>> getPopularMoviesFromDatabase() {
    getPopularMovies(1);
    return movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getPopularMoviesStream())
        .map((event) => movieDao.getPopularMovies());
  }

  @override
  Stream<List<MovieVO>> getTopRelatedMoviesFromDatabase() {
    getTopRelatedMovies(1);
    return movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getTopRatedMoviesStream())
        .map((event) => movieDao.getTopRatedMovies());
  }

  @override
  Stream<List<GenreVO>> getMovieGenresFromDatabase() {
    getMovieGenres();
    return genreDao
        .getAllGenresEventStream()
        .startWith(genreDao.getAllGenresStream())
        .map((event) => genreDao.getAllGenres());
  }

  @override
  Stream<List<GenreVO>> getMovieGenresByIdsFromDatabase(List<int> ids) {
    return genreDao
        .getAllGenresEventStream()
        .startWith(genreDao.getGenresByIdsStream(ids))
        .map((event) => genreDao.getGenresByIds(ids));
  }

  @override
  Stream<List<ActorVO>> getActorsFromDatabase() {
    getActors();
    return actorDao
        .getAllActorsEventStream()
        .startWith(actorDao.getAllActorsStream())
        .map((event) => actorDao.getAllActors());
  }

  @override
  Stream<MovieVO> getMovieDetailsFromDatabase(int id) {
    var movie = movieDao.getMovieById(id);

    return Stream.value(
      movie!
    );
  }

  /// End of Database
}