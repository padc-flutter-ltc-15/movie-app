
import 'package:flutter/material.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:themovieapp/data/models/movie_model.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';
import 'package:themovieapp/network/dataagents/movie_data_agent.dart';
import 'package:themovieapp/network/dataagents/retrofit_movie_data_agent_impl.dart';
import 'package:themovieapp/persistence/dao/actor_dao.dart';
import 'package:themovieapp/persistence/dao/genre_dao.dart';
import 'package:themovieapp/persistence/dao/movie_dao.dart';

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
    getPopularMovies(1);
    getNowPlayingMoviesFromDatabase();
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
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
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
      getMoviesByGenre(genres.first.id);

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
  void getActors() {
    _movieDataAgent.getActors(1).then((actors) async {
      actorDao.saveAllActors(actors);

      this.actorList = actors;

      notifyListeners();
    });
  }

  @override
  void getMovieDetails(int id) {
    _movieDataAgent.getMovieDetails(id).then((movieDetail) {
      this.movieDetail = movieDetail;

      getMovieGenresByIdsFromDatabase(this.movieDetail?.genreIds??[]);

      notifyListeners();
    });
  }

  @override
  void getMovieDetailsCredits(int id) {
    _movieDataAgent.getMovieDetailsCredits(id).then((response) {
      this.crewList = response.crew??[];
      this.castsList = response.cast??[];

      notifyListeners();
    });
  }

  /// Database
  @override
  void getNowPlayingMoviesFromDatabase() {

    getNowPlayingMovies(1);

    movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getNowPlayingMoviesStream())
        .map((event) => movieDao.getNowPlayingMovies())
        .listen((movies) {
          this.nowPlayingMovieList = movies;

          notifyListeners();
        });
  }

  @override
  void getPopularMoviesFromDatabase() {

    getPopularMovies(1);

    movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getPopularMoviesStream())
        .map((event) => movieDao.getPopularMovies())
        .listen((movies) {
          this.popularMovieList = movies;

          notifyListeners();
        });
  }

  @override
  void getTopRelatedMoviesFromDatabase() {

    getTopRelatedMovies(1);

    movieDao
        .getAllMoviesEventStream()
        .startWith(movieDao.getTopRatedMoviesStream())
        .map((event) => movieDao.getTopRatedMovies())
        .listen((movies) {
          this.topRatedMovieList = movies;

          notifyListeners();
        });
  }

  @override
  void getMovieGenresByIdsFromDatabase(List<int> ids) {
    genreDao
        .getAllGenresEventStream()
        .startWith(genreDao.getGenresByIdsStream(ids))
        .map((event) => genreDao.getGenresByIds(ids))
        .listen((genres) {
          this.movieDetailGenreList = genres;

          notifyListeners();
        });
  }

  @override
  void getActorsFromDatabase() {
    getActors();

    actorDao
        .getAllActorsEventStream()
        .startWith(actorDao.getAllActorsStream())
        .map((event) => actorDao.getAllActors())
        .listen((actors) {
          this.actorList = actors;

          notifyListeners();
        });
  }

  @override
  void getMovieDetailsFromDatabase(int id) {
    getMovieDetails(id);
  }

  @override
  void getMovieGenresFromDatabase() {
    getMovieGenres();

    genreDao
        .getAllGenresEventStream()
        .startWith(genreDao.getAllGenresStream())
        .map((event) => genreDao.getAllGenres())
        .listen((genres) {
          this.genreList = genres;

          notifyListeners();
        });
  }
}