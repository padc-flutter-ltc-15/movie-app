
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

  /// Dao
  MovieDao movieDao = MovieDao();
  GenreDao genreDao = GenreDao();
  ActorDao actorDao = ActorDao();

  MovieDataAgent _movieDataAgent = RetrofitMovieDataAgentImpl();

  /// static final variable
  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  /// private constructor
  MovieModelImpl._internal() {
    getNowPlayingMoviesFromDatabase();
    getPopularMoviesFromDatabase();
    getTopRelatedMoviesFromDatabase();
    getMovieGenresFromDatabase();
    getActorsFromDatabase();
  }

  /// factory constructor
  factory MovieModelImpl() {
    return _singleton;
  }

  /// Network
  @override
  void getNowPlayingMovies(int page) {
    _movieDataAgent.getNowPlayingMovies(page).then((movies) async {
      List<MovieVO> nowPlayingMovieList = movies.map((movie) {
        movie.isNowPlaying = true;
        movie.isPopular = false;
        movie.isTopRated = false;

        return movie;
      }).toList();

      movieDao.saveAllMovies(nowPlayingMovieList);

      this.nowPlayingMovieList = nowPlayingMovieList;

      notifyListeners();
    });
  }

  @override
  void getPopularMovies(int page) {
    _movieDataAgent.getPopularMovies(page).then((movies) async {
      List<MovieVO> popularMovieList = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = true;
        movie.isTopRated = false;

        return movie;
      }).toList();

      movieDao.saveAllMovies(popularMovieList);

      this.popularMovieList = popularMovieList;

      notifyListeners();
    });
  }

  @override
  void getTopRelatedMovies(int page) {
    _movieDataAgent.getTopRelatedMovies(page).then((movies) async {
      List<MovieVO> topRelatedMovieList = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = false;
        movie.isTopRated = true;

        return movie;
      }).toList();

      movieDao.saveAllMovies(topRelatedMovieList);

      this.topRatedMovieList = movies;

      notifyListeners();
    });
  }

  @override
  void getMovieGenres() {
    _movieDataAgent.getMovieGenres(1).then((genres) async {
      genreDao.saveAllGenres(genres);

      this.genreList = genres;

      notifyListeners();
    });
  }

  @override
  void getMoviesByGenre(int genreId) {
    _movieDataAgent.getMoviesByGenre(1, genreId).then((movies) async {
      movieDao.saveAllMovies(movies);

      this.movieByGenreList = movies;

      notifyListeners();
    });
  }

  @override
  Future<List<ActorVO>> getActors() {
    return _movieDataAgent.getActors(1).then((actors) async {
      actorDao.saveAllActors(actors);

      this.actorList = actors;

      notifyListeners();

      return Future.value(actors);
    });
  }

  @override
  Future<MovieVO?> getMovieDetails(int id) {
    return _movieDataAgent.getMovieDetails(id);
  }

  @override
  Future<GetMovieDetailsCreditsResponse?> getMovieDetailsCredits(int id) {
    return _movieDataAgent.getMovieDetailsCredits(id);
  }

  /// Database
  @override
  void getNowPlayingMoviesFromDatabase() {

    getNowPlayingMovies(1);

    movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getNowPlayingMovies())
        .combineLatest(movieDao.getNowPlayingMovies(), (event, movies) => movies)
        .first
        .then((movies) {
          this.nowPlayingMovieList = movies;
          notifyListeners();
        });
  }

  @override
  void getPopularMoviesFromDatabase() {

    getPopularMovies(1);

    movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getPopularMovies())
        .combineLatest(movieDao.getPopularMovies(), (event, movies) => movies)
        .first
        .then((movies) {
          this.popularMovieList = movies;
          notifyListeners();
        });
  }

  @override
  void getTopRelatedMoviesFromDatabase() {

    getTopRelatedMovies(1);

    movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getTopRelatedMovies())
        .combineLatest(movieDao.getTopRelatedMovies(), (event, movies) => movies)
        .first
        .then((movies) {
          this.topRatedMovieList = movies;
          notifyListeners();
        });
  }

  @override
  Future<List<GenreVO>> getMovieGenresByIdsFromDatabase(List<int> ids) {
    var genres = genreDao
        .getGenresByIds(ids)
        .toList();

    debugPrint("genres: " + genres.toString());

    return Future.value(
        genres
    );
  }

  @override
  void getActorsFromDatabase() {
    getActors();

    actorDao
        .getAllActorsEventStream()
        .startWith(actorDao.getAllActors())
        .combineLatest(actorDao.getAllActors(), (event, actors) => actors)
        .first
        .then((actors) {
          this.actorList = actors;
          notifyListeners();
        });
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
  void getMovieGenresFromDatabase() {
    getMovieGenres();

    genreDao
        .getAllGenresEventStream()
        .startWith(genreDao.getAllGenres())
        .combineLatest(genreDao.getAllGenres(), (event, genres) => genres)
        .first
        .then((genres) {
          this.genreList = genres;
          notifyListeners();

          getMoviesByGenre(genres[0].id);
        });
  }
}