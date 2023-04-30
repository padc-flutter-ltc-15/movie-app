import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/data/models/movie_model_impl.dart';
import 'package:themovieapp/data/vos/actor_vo.dart';
import 'package:themovieapp/data/vos/movie_vo.dart';

import '../mock_data/mock_data.dart';
import '../network/movie_data_agent_impl_mock.dart';
import '../persistence/daos/actor_dao_impl_mock.dart';
import '../persistence/daos/genre_dao_impl_mock.dart';
import '../persistence/daos/movie_dao_impl_mock.dart';

void main() {
  group("movie_model_impl", () {
    var movieModel = MovieModelImpl();

    setUp(() {
      movieModel.setDaosAndDataAgents(
        MovieDaoImplMock(),
        ActorDaoImplMock(),
        GenreDaoImplMock(),
        MovieDataAgentImplMock(),
      );
    });

    test(
        "Saving Now Playing Movies and Getting Now Playing Movies from Database",
        () {
      expect(
        movieModel.getNowPlayingMoviesFromDatabase(),
        emits(
          [
            MovieVO(true, null, [], 3, "", "Batman", "Batman", null, null, null, "Batman", null, null, null, false, false, true),
          ],
        ),
      );
    });

    test("Saving Popular Movies and Getting Popular Movies from Database", () {
      expect(
        movieModel.getPopularMoviesFromDatabase(),
        emits(
          [
            MovieVO(true, null, [], 2, "", "Superman", "Superman", null, null, null, "Superman", null, null, null, false, true, false),
          ]
        ),
      );
    });

    // emits for Stream
    test("Saving TopRated Movies and Getting Top Rated Movies from Database",
        () {
      expect(
        movieModel.getPopularMoviesFromDatabase(),
        emits(
          [
            MovieVO(true, null, [], 2, "", "Superman", "Superman", null, null, null, "Superman", null, null, null, false, true, false),
          ],
        ),
      );
    });

    // completion equals for Future
    test("Get Genres Test", () {
      expect(
        movieModel.getMovieGenres(),
        completion(
          equals(
            getMockGenres(),
          ),
        ),
      );
    });

    test("Get Actor Test", () {
      expect(
        movieModel.getActors(),
        completion(
          equals(
            getMockActors(),
          ),
        ),
      );
    });

    test("Get Credit Test", () {
      expect(
        movieModel.getMovieDetailsCredits(1),
        completion(
          equals(
            getMockMovieDetailsCreditsResponse(),
          ),
        ),
      );
    });

    test("Get Movie Details Test", () {
      expect(
        movieModel.getMovieDetails(1),
        completion(
          equals(
            getMockMoviesForTest().first,
          ),
        ),
      );
    });

    // Future ဆို completion, equals
    test("Get Actors From Database", () async {
      expect(
        movieModel.getActors(),
        completion(
          equals(
            getMockActors(),
          ),
        ),
      );
    });

    // Stream ဆို emits
    test("Get Actors From Database", () async {
      movieModel.getActors();
      expect(
        movieModel.getActorsFromDatabase(),
        emits(
          getMockActors(),
        ),
      );
    });

    test("Get Genres From Database", () async {
      await movieModel.getMovieGenres();
      expect(
        movieModel.getMovieGenresFromDatabase(),
        emits(
          getMockGenres(),
        ),
      );
    });

    test("Get Movie Details From Database", () async {
      await movieModel.getMovieDetails(1);
      expect(
        movieModel.getMovieDetails(1),
        completion(
          equals(
            getMockMoviesForTest().first,
          ),
        ),
      );
    });
  });
}
